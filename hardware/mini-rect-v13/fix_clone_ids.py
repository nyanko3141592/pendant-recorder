"""Assign stable distinct identities to the two added resistor instances."""
import uuid
import pcbnew as k

def fix(b):
 for f in b.GetFootprints():
  if f.GetReference() not in ['R29','R30']:continue
  base='pendant-recorder/mini-rect-v13/'+f.GetReference()
  def identity(obj,suffix):obj.SetUuid(k.KIID(str(uuid.uuid5(uuid.NAMESPACE_URL,base+'/'+suffix))))
  identity(f,'footprint')
  for i,p in enumerate(f.Pads()):identity(p,'pad/'+str(i))
  for i,g in enumerate(f.GraphicalItems()):identity(g,'graphic/'+str(i))
  identity(f.Reference(),'reference');identity(f.Value(),'value')
 ids=[f.m_Uuid.AsString() for f in b.GetFootprints()]+[p.m_Uuid.AsString() for f in b.GetFootprints() for p in f.Pads()]
 assert len(ids)==len(set(ids))

if __name__=='__main__':
 import sys
 b=k.LoadBoard(sys.argv[1]);fix(b);k.SaveBoard(sys.argv[1],b)
