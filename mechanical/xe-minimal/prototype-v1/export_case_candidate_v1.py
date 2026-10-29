"""Export coherent candidate case, assembled and exploded models."""
from pathlib import Path
import hashlib
import json
import cadquery as cq

HERE = Path(__file__).resolve().parent
MECH = HERE.parent
ROOT = MECH.parents[1]

def load(path):
    shape = cq.importers.importStep(str(path)).val()
    assert shape.isValid(), path
    return shape

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

lower_src = MECH / "rounded-glue-reinforced-lower-study.step"
upper_src = MECH / "rounded-glue-reinforced-upper-study.step"
internals_src = HERE / "integrated-assembly-v1.step"
carrier_src = HERE / "sensor-carrier-v1.step"

lower, upper = load(lower_src), load(upper_src)
internals, carrier = load(internals_src), load(carrier_src)

assembled = cq.Assembly(name="xe_prototype_v1_case_candidate")
assembled.add(lower, name="lower", color=cq.Color(.65,.68,.72))
assembled.add(internals, name="internals", color=cq.Color(.25,.55,.35))
assembled.add(upper, name="upper", color=cq.Color(.75,.78,.82))
assembled_path = HERE / "case-assembly-candidate-v1.step"
assembled.export(str(assembled_path))

exploded = cq.Assembly(name="xe_prototype_v1_exploded")
exploded.add(lower.translate((0,0,-12)), name="lower", color=cq.Color(.65,.68,.72))
exploded.add(internals, name="internals", color=cq.Color(.25,.55,.35))
exploded.add(upper.translate((0,0,12)), name="upper", color=cq.Color(.75,.78,.82))
exploded_path = HERE / "case-exploded-candidate-v1.step"
exploded.export(str(exploded_path))

lower_step = HERE / "case-lower-candidate-v1.step"
upper_step = HERE / "case-upper-candidate-v1.step"
lower_stl = HERE / "case-lower-candidate-v1.stl"
upper_stl = HERE / "case-upper-candidate-v1.stl"
cq.exporters.export(lower, str(lower_step))
cq.exporters.export(upper, str(upper_step))
cq.exporters.export(lower, str(lower_stl), tolerance=.02, angularTolerance=.1)
cq.exporters.export(upper, str(upper_stl), tolerance=.02, angularTolerance=.1)

bb = load(assembled_path).BoundingBox()
report = {
    "version":"XE-PROTOTYPE-V1",
    "status":"COHERENT_CASE_CANDIDATE_EXPORTED_NOT_RELEASED",
    "complete_exterior_bbox_mm":[bb.xlen,bb.ylen,bb.zlen],
    "complete_exterior_bounds_mm":[bb.xmin,bb.xmax,bb.ymin,bb.ymax,bb.zmin,bb.zmax],
    "closure":"Initial prototype glue at case mating seam only",
    "outputs_sha256":{
        str(path.relative_to(ROOT)):sha(path)
        for path in [assembled_path,exploded_path,lower_step,upper_step,lower_stl,upper_stl,carrier_src]
    },
    "sources_sha256":{
        str(path.relative_to(ROOT)):sha(path)
        for path in [lower_src,upper_src,internals_src]
    },
    "limitations":[
        "Rounded shell geometry is reused only after the canonical nominal collision screen; it is not physically printed or adopted for ordering.",
        "Battery harness corridor is provisional and plug removal motion is not verified.",
        "Sensor pad material/compression, thermal lag and pouch pressure remain unqualified.",
        "STL generation does not prove A1 mini printability, strength, mating tolerance or acoustic performance.",
        "No neck-cord feature is included in this candidate, so this is not the final complete exterior model."
    ]
}
(HERE/"case-candidate-v1-review.json").write_text(json.dumps(report,ensure_ascii=False,indent=2)+"\n")
print(json.dumps({"status":report["status"],"bbox_mm":report["complete_exterior_bbox_mm"]}))
