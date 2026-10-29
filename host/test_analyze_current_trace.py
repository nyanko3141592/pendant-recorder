import unittest
from analyze_current_trace import analyze

class CurrentTraceTests(unittest.TestCase):
    def test_irregular_linear_ramp_and_window_boundary(self):
        # i(t)=t across irregular sample intervals, integral0..12=72mC.
        r=analyze([(0,0),(3,3),(7,7),(12,12)],'battery',5,4.8125)
        self.assertAlmostEqual(r['charge_mC'],72)
        self.assertEqual(r['window_charge_mC'],[12.5,37.5])
        self.assertEqual(r['trailing_unwindowed_s'],2)
        self.assertFalse(r['runtime_16h_proven'])
    def test_short_trace_not_a_complete_window(self):
        r=analyze([(10,4),(11,4)],'storage',1,2.0125)
        self.assertEqual(r['full_5s_windows'],0)
        self.assertEqual(r['charge_mC'],4)
    def test_budget_changes_classification_not_charge(self):
        trace=[(0,2),(5,2),(10,2)]
        small=analyze(trace,'battery',5,1.75)
        large=analyze(trace,'battery',5,4.8125)
        self.assertEqual(small['windows_above_design_allocation'],2)
        self.assertEqual(large['windows_above_design_allocation'],0)
        self.assertEqual(small['charge_mC'],large['charge_mC'])
        for budget in [0,-1,float('inf'),float('nan')]:
            with self.subTest(budget=budget), self.assertRaises(ValueError):
                analyze(trace,'battery',5,budget)

    def test_bad_trace_rejected(self):
        for trace in [[(0,1)],[(0,1),(0,2)],[(1,1),(0,2)],[(0,1),(2,1)],
                      [(0,1),(1,float('nan'))],[(0,1),(1,-1)]]:
            with self.subTest(trace=trace), self.assertRaises(ValueError):
                analyze(trace,'battery',1,4.8125)

if __name__=='__main__':unittest.main()
