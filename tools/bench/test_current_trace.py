import tempfile,unittest
from pathlib import Path
from integrate_current_trace import integrate
class TraceTests(unittest.TestCase):
 def sample(self,text,gap):
  with tempfile.TemporaryDirectory()as d:
   p=Path(d)/'trace.csv';p.write_text('time_s,current_mA,voltage_V\n'+text)
   return integrate(p,gap)
 def test_known_integral(self):
  r=self.sample('0,2,4\n3600,4,4\n',3600)
  self.assertEqual(r['integrated_charge_mAh'],3)
  self.assertEqual(r['integrated_energy_mWh'],12)
  self.assertIsNone(r['runtime_pass'])
 def test_gap_blocks_coverage(self):
  r=self.sample('0,4,4\n57600,4,4\n',1)
  self.assertFalse(r['coverage_at_least_16h_without_gap_violation'])
 def test_bad_samples(self):
  for body in ['0,1,4\n0,1,4\n','0,1,4\n1,-1,4\n','0,1,4\n1,nan,4\n']:
   with self.subTest(body=body),self.assertRaises(ValueError):self.sample(body,1)
 def test_synthetic_coverage_never_certifies(self):
  r=self.sample('0,4,4\n57600,4,4\n',57600)
  self.assertTrue(r['coverage_at_least_16h_without_gap_violation'])
  self.assertIsNone(r['runtime_pass'])
if __name__=='__main__':unittest.main()
