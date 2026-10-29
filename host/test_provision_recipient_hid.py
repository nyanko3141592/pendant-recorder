import sys,time,unittest
from unittest.mock import patch
sys.path.insert(0,__file__.rsplit('/',1)[0])
from provision_recipient_hid import build_request,build_cleanup_request,parse_response,provision,queue_cleanup,crc32

RECIPIENT='age1qypqxpq9qcrsszg2pvxq6rs0zqg3yyc5z5tpwxqergd3c8g7rusqmwn7f2'
class Fake:
 def __init__(self,status=1,key=b'\0'*32):self.status=status;self.key=key;self.sent=[];self.polls=0
 def response(self):
  p=bytearray(64);p[0]=1;p[1]=self.status
  if self.status==3:p[4:36]=self.key
  p[36:40]=crc32(p[:36]).to_bytes(4,'little');return bytes([1])+p
 def get_feature_report(self,_id,_n):
  self.polls+=1
  if self.sent and self.status==1:self.status=2
  elif self.sent and self.status==2:self.status=3;self.key=self.sent[0][5:37]
  return self.response()
 def send_feature_report(self,data):self.sent.append(bytes(data));return len(data)

class Protocol(unittest.TestCase):
 def test_request_response_and_commit(self):
  request,key=build_request(RECIPIENT);self.assertEqual(len(request),65);self.assertEqual(key,bytes(range(1,33)))
  device=Fake();
  with patch.object(time,'sleep',lambda _:None):self.assertEqual(provision(device,RECIPIENT),'provisioned')
  self.assertEqual(device.key,key);self.assertGreaterEqual(device.polls,3)
 def test_idempotent_and_wrong_existing(self):
  _,key=build_request(RECIPIENT);self.assertEqual(provision(Fake(3,key),RECIPIENT),'already-provisioned')
  with self.assertRaisesRegex(RuntimeError,'another recipient'):provision(Fake(3,b'X'*32),RECIPIENT)
 def test_physical_confirmation_retry(self):
  class Confirm(Fake):
   def get_feature_report(self,i,n):
    if self.status==5 and len(self.sent)>=2:self.status=1
    return super().get_feature_report(i,n)
  device=Confirm(5)
  with patch.object(time,'sleep',lambda _:None):self.assertEqual(provision(device,RECIPIENT),'provisioned')
  self.assertGreaterEqual(len(device.sent),2)
 def test_corruption_and_failure(self):
  bad=bytearray(Fake().response());bad[10]^=1
  with self.assertRaisesRegex(ValueError,'CRC'):parse_response(bad)
  with self.assertRaisesRegex(RuntimeError,'failed'):provision(Fake(4),RECIPIENT)
 def test_cleanup_queue(self):
  _,key=build_request(RECIPIENT);device=Fake(3,key)
  original=device.get_feature_report
  def response(i,n):
   data=bytearray(original(i,n))
   if device.sent:data[3]=1;data[37:41]=crc32(data[1:37]).to_bytes(4,'little')
   return bytes(data)
  device.get_feature_report=response
  self.assertEqual(queue_cleanup(device,7,99),'cleanup-queued')
  request=build_cleanup_request(7,99);self.assertEqual(device.sent[-1],request)

if __name__=='__main__':unittest.main()
