"""Tangent circular wire sweep shared by mechanical routing studies."""
import cadquery as cq
import numpy as np
import math
def rounded(points,r,wire_radius=.155):
 p=[np.array(x,dtype=float) for x in points]; corners={}; trims={}
 radii=[float(r)]*(len(p)-2) if np.isscalar(r) else list(r)
 if len(radii)!=len(p)-2 or any(x<=0 for x in radii) or wire_radius<=0:raise ValueError('invalid radii')
 for i in range(1,len(p)-1):
  r=radii[i-1]
  u=(p[i]-p[i-1]);u/=np.linalg.norm(u);v=p[i+1]-p[i];v/=np.linalg.norm(v)
  theta=math.acos(np.clip(np.dot(u,v),-1,1));t=r*math.tan(theta/2)
  a=p[i]-t*u;b=p[i]+t*v;n=v-np.dot(u,v)*u;n/=np.linalg.norm(n);c=a+r*n
  mid=c+r*((a-c)+(b-c))/np.linalg.norm((a-c)+(b-c))
  corners[i]=(a,mid,b);trims[i]=t
 for i in range(len(p)-1):
  if trims.get(i,0)+trims.get(i+1,0)>=np.linalg.norm(p[i+1]-p[i])-1e-7: raise ValueError('radius requires more tangent length than segment provides')
 edges=[];last=p[0]
 for i in range(1,len(p)-1):
  a,m,b=corners[i];edges.append(cq.Edge.makeLine(cq.Vector(*last),cq.Vector(*a)));edges.append(cq.Edge.makeThreePointArc(cq.Vector(*a),cq.Vector(*m),cq.Vector(*b)));last=b
 edges.append(cq.Edge.makeLine(cq.Vector(*last),cq.Vector(*p[-1])))
 path=cq.Wire.assembleEdges(edges);normal=cq.Vector(*(p[1]-p[0]))
 shape=cq.Workplane(cq.Plane(origin=cq.Vector(*p[0]),normal=normal)).circle(wire_radius).sweep(cq.Workplane(obj=path),isFrenet=True).val()
 return shape,path.Length()
