"""Create a new ACL-protected Windows directory before writing any key material.

Requires a local filesystem with persistent ACLs. Native Windows validation pending.
"""
import ctypes as c
from ctypes import wintypes as w
import os
from pathlib import Path


def create_private_directory(path):
    if os.name != 'nt':
        raise OSError('Windows ACL directory creation requires Windows')
    k = c.WinDLL('kernel32', use_last_error=True)
    a = c.WinDLL('advapi32', use_last_error=True)
    P = c.c_void_p
    def api(dll, name, args, result=w.BOOL):
        fn = getattr(dll, name); fn.argtypes = args; fn.restype = result
        return fn
    def check(ok):
        if not ok: raise c.WinError(c.get_last_error())
    get_process = api(k, 'GetCurrentProcess', [], w.HANDLE)
    close = api(k, 'CloseHandle', [w.HANDLE])
    free = api(k, 'LocalFree', [P], P)
    open_token = api(a, 'OpenProcessToken', [w.HANDLE, w.DWORD, c.POINTER(w.HANDLE)])
    token_info = api(a, 'GetTokenInformation', [w.HANDLE, c.c_int, P, w.DWORD, c.POINTER(w.DWORD)])
    sid_string = api(a, 'ConvertSidToStringSidW', [P, c.POINTER(P)])
    convert = api(a, 'ConvertStringSecurityDescriptorToSecurityDescriptorW', [w.LPCWSTR, w.DWORD, c.POINTER(P), P])
    volume = api(k, 'GetVolumeInformationW', [w.LPCWSTR, w.LPWSTR, w.DWORD, P, P, c.POINTER(w.DWORD), w.LPWSTR, w.DWORD])
    attrs = api(k, 'GetFileAttributesW', [w.LPCWSTR], w.DWORD)
    class SA(c.Structure):
        _fields_ = [('length', w.DWORD), ('descriptor', P), ('inherit', w.BOOL)]
    mkdir = api(k, 'CreateDirectoryW', [w.LPCWSTR, c.POINTER(SA)])
    file_security = api(a, 'GetFileSecurityW', [w.LPCWSTR, w.DWORD, P, w.DWORD, c.POINTER(w.DWORD)])
    get_control = api(a, 'GetSecurityDescriptorControl', [P, c.POINTER(w.WORD), c.POINTER(w.DWORD)])
    get_dacl = api(a, 'GetSecurityDescriptorDacl', [P, c.POINTER(w.BOOL), c.POINTER(P), c.POINTER(w.BOOL)])
    get_ace = api(a, 'GetAce', [P, w.DWORD, c.POINTER(P)])
    equal_sid = api(a, 'EqualSid', [P, P])
    class TOKEN_USER(c.Structure):
        _fields_ = [('sid', P), ('attributes', w.DWORD)]
    class ACL(c.Structure):
        _fields_ = [('revision', c.c_ubyte), ('reserved', c.c_ubyte), ('size', w.WORD), ('count', w.WORD), ('reserved2', w.WORD)]
    class ACE(c.Structure):
        _fields_ = [('type', c.c_ubyte), ('flags', c.c_ubyte), ('size', w.WORD), ('mask', w.DWORD), ('sid_start', w.DWORD)]
    path = Path(path).absolute()
    if not path.drive or path.drive.startswith('\\\\') or str(path).startswith('\\\\'):
        raise ValueError('Use a local drive path for recording keys')
    # Reject known junctions/symlinks before creation. Parent must already exist.
    for parent in [path.parent, *path.parent.parents]:
        flags = attrs(str(parent))
        if flags == 0xffffffff: raise c.WinError(c.get_last_error())
        if flags & 0x400: raise ValueError('Reparse-point parents are not supported')
    flags = w.DWORD()
    check(volume(path.anchor, None, 0, None, None, c.byref(flags), None, 0))
    if not flags.value & 0x8:
        raise ValueError('Key directory requires a filesystem with persistent ACLs')
    token = w.HANDLE(); sid_text = P(); descriptor = P()
    try:
        check(open_token(get_process(), 0x8, c.byref(token)))
        size = w.DWORD()
        token_info(token, 1, None, 0, c.byref(size))
        if not size.value: raise c.WinError(c.get_last_error())
        buffer = c.create_string_buffer(size.value)
        check(token_info(token, 1, buffer, size, c.byref(size)))
        sid = c.cast(buffer, c.POINTER(TOKEN_USER)).contents.sid
        check(sid_string(sid, c.byref(sid_text)))
        text = c.wstring_at(sid_text)
        # Protected DACL with one inheritable full-control ACE for the current SID.
        check(convert(f'O:{text}D:P(A;OICI;FA;;;{text})', 1, c.byref(descriptor), None))
        sa = SA(c.sizeof(SA), descriptor, False)
        check(mkdir(str(path), c.byref(sa)))  # Fails on existing directory or link.
        size = w.DWORD()
        file_security(str(path), 4, None, 0, c.byref(size))
        if not size.value: raise c.WinError(c.get_last_error())
        actual = c.create_string_buffer(size.value)
        check(file_security(str(path), 4, actual, size, c.byref(size)))
        control = w.WORD(); revision = w.DWORD()
        check(get_control(actual, c.byref(control), c.byref(revision)))
        present = w.BOOL(); defaulted = w.BOOL(); acl = P()
        check(get_dacl(actual, c.byref(present), c.byref(acl), c.byref(defaulted)))
        if not control.value & 0x1000 or not present.value or not acl.value:
            raise ValueError('Private directory DACL verification failed')
        if c.cast(acl, c.POINTER(ACL)).contents.count != 1:
            raise ValueError('Unexpected directory access entries')
        ace_ptr = P(); check(get_ace(acl, 0, c.byref(ace_ptr)))
        ace = c.cast(ace_ptr, c.POINTER(ACE)).contents
        if ace.type != 0 or ace.flags != 3 or ace.mask != 0x1f01ff:
            raise ValueError('Unexpected private directory permissions')
        if not equal_sid(ace_ptr.value + ACE.sid_start.offset, sid):
            raise ValueError('Private directory SID mismatch')
    finally:
        if descriptor.value: free(descriptor)
        if sid_text.value: free(sid_text)
        if token.value: close(token)
    return path
