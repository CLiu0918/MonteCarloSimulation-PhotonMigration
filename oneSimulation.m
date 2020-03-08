function [Fluence,time] = oneSimulation(p,v,S,us,ua,npSub,speed)
    Fluence= zeros(20,20,20);  
for i=1: 100
[d,dist,distance,deltaw,p,npSub,S] = onescattering(p,v,S,us,ua,npSub);
    if S==0
    [v_new,v_new_norm] = scattering_dir(v);
     v = v_new_norm;
     S = -log(rand());
    end 
   w_voxel(i)=deltaw;
if d==dist      
    pindex = floor(p);
            if p(1)<1 || p(2)<1 || p(3)<1
            index = pindex<1;
            pindex(index==1)=1; 
            end
    Fluence(pindex(1),pindex(2),pindex(3)) = sum(w_voxel(:)); 
    % Save the Fluence when the photon hits the boundary
    w_voxel = 0;
          
end
   position(i+1,:)=p;
   time = distance / speed ; % unit in sec
   %Simulation terminates when photon exits the domain 
   if p(1)>20 || p(2)>20 || p(3)>20 || p(1)<0 || p(2)<0 || p(3)<0 % If out of domain 
       disp('Domian exceeds');
       break
   end
   
   % Russian Roulette 
   if npSub<10e-6
       disp('Insufficent Photon');
       break
   end

end

end

