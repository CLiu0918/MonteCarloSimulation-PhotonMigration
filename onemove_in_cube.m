
function [dist, id, htime] = onemove_in_cube(p0,v)
% input:
% p0: current position (in x, y,z), 1x3 vector
% v: current normalized direction (vx,vy,vz), 1x3 vector
% output:
% dist: the shortest distance to intersect with a voxel wall, in mm
% id: 1: ray intersects x-plane, 2: intersects y-plane, and 3: intersects z-plane
% htime: output, the next position, 1x3 vector
 htime=abs((floor(p0)-p0+(v>0))./v);
 [dist,id]=min(htime);
 htime=p0+dist*v;
 htime(id)=round(htime(id))+eps(single(htime(id)))*sign(v(id));
end
