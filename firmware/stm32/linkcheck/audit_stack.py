"""Direct-call static stack screen. Indirect calls, IRQ nesting and libc remain unproven."""
import argparse,json,re,subprocess
from pathlib import Path
ap=argparse.ArgumentParser();ap.add_argument('build',type=Path);ap.add_argument('--output',type=Path,required=True);ap.add_argument('--callbacks',type=Path);a=ap.parse_args()
frames={};kinds={}
for p in a.build.glob('*.su'):
 for line in p.read_text().splitlines():
  fields=line.split('\t')
  if len(fields)==3:
   name=fields[0].rsplit(':',1)[-1]
   frames[name]=max(frames.get(name,0),int(fields[1]));kinds[name]=fields[2]
elf=a.build/'candidate-NOT-FOR-FLASH.elf'
text=subprocess.check_output(['arm-none-eabi-objdump','-d',str(elf)],text=True)
graph={};indirect=set();current=None
for line in text.splitlines():
 m=re.match(r'^[0-9a-f]+ <([^>]+)>:',line)
 if m:current=m[1];graph.setdefault(current,set());continue
 if current is None:continue
 m=re.search(r'\b(?:bl|blx|b\.w)\s+[0-9a-f]+ <([^>]+)>',line)
 if m:
  name=m[1].split('+')[0]
  if name!=current:graph[current].add(name)
 elif re.search(r'\bblx\s+r\d+',line):indirect.add(current)
callbacks=json.loads(a.callbacks.read_text()) if a.callbacks else {}
for caller,targets in callbacks.items():
 if caller not in graph:raise ValueError('Callback caller absent from ELF: '+caller)
 for target in targets:
  if target not in graph:raise ValueError('Callback target absent from ELF: '+target)
  graph[caller].add(target)
unknown=set();cycles=set()
def path(name,seen):
 if name in seen:cycles.add(name);return 0,[]
 if name not in frames:unknown.add(name)
 children=[path(c,seen|{name}) for c in graph.get(name,())]
 size,chain=max(children,default=(0,[]),key=lambda x:x[0])
 return frames.get(name,0)+size,[name]+chain
results={}
for root in ['main','age_write_recording','plencrypt','pldecrypt','cooperative_pipeline_service','cooperative_pipeline_pump']:
 if root not in graph:
  results[root]={'present_in_elf':False};continue
 size,chain=path(root,set());results[root]={'known_direct_frame_sum_bytes':size,'chain':chain}
symbols=subprocess.check_output(['arm-none-eabi-nm',str(elf)],text=True)
reserved=int(re.search(r'^([0-9a-fA-F]+) \w _Min_Stack_Size$',symbols,re.M)[1],16)
r={'status':'PARTIAL_STATIC_SCREEN_NOT_STACK_PROOF','roots':results,'declared_callback_edges':callbacks,'largest_frames':sorted([{'function':n,'bytes':v,'kind':kinds[n]} for n,v in frames.items()],key=lambda x:x['bytes'],reverse=True)[:12],'indirect_call_functions':sorted(indirect),'missing_frame_metadata':sorted(unknown),'cycles':sorted(cycles),'reserved_stack_bytes':reserved,'limitations':['Known frames only; missing metadata treated as zero, so sums are not safe upper bounds','Only explicitly declared callbacks are included; other indirect calls and interrupt nesting excluded','Tail calls conservatively add frames; compiler inlining reflected by SU files','Stack reservation must be qualified by full call graph and runtime high-water/canary tests']}
a.output.write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(results,indent=2))
