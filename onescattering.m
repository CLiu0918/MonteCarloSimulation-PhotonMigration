function [d,dist,distance,deltaw,p,npSub,S] = onescattering(p,v,S,us,ua,npSub)
[dist, id, htime] = onemove_in_cube(p,v);
    d =  min(dist, S/us);
    distance = d;
       % move photon by d:
        if d ==dist    % photon leaves the voxel. need to accumulate the photon absorbed within the cell 
           p=htime;
           S = S-d*us;
           deltaw  = npSub * (1-exp(-ua*d));  % Photon lost in the cell 
           npSub = npSub - deltaw;     
        else 
           p = p+d*v; % p is changing but still in the same voxel. don't save the fluent postion    
           deltaw  = npSub * (1-exp(-ua*d));  % Photon lost in the cell 
           npSub = npSub - deltaw; 
           S =  S-d*us ;% after this step, S=0; 
        end
    
end

