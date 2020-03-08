function [v_new,v_new_norm] = scattering_dir(v)
% v is the lastscattering direction 

vx=v(1); vy=v(2); vz=v(3);
Phi = 2*pi*rand;   
% generate Rayleigh scattering phase 
p = @(u) 3/4*(1+u.^2) ;  % pdf function u is the cos(theta)
cdf_norm=integral(p,-1,1);   % normalization scalar
p_norm = @(u) 3/4*(1+u.^2)./cdf_norm;  % normalized pdf
syms u    % u is the cos(theta)
cdf = int(p_norm, -1, u); % integral from -1 to u to get the cdf 
cdf_inv = finverse(cdf,u);   % find the inverse function of the cdf
Var = rand();  % generating a random varible from 0 to 1  
theta = double(subs(cdf_inv,u,Var));  % obtain the Rayleigh phase pdf distributed scattering angle 

%% Update the scattering direction 
if vx==0 && vy==0
    vx = sin(theta) * cos(Phi);
    vy = sin(theta) * sin(Phi);
    vz = sign(vz)*cos(theta);
else 
   B = 1- vz^2;
   A =  sin(theta) / sqrt(B);
   vx = A* (vx*vz*cos(Phi)-vy*sin(Phi)) + vx * cos(theta);
   vy = A* (vy * vz * cos(Phi)+vx*sin(Phi))+vy * cos(theta);
   vz = -A * B*cos(Phi) + vz * cos(theta); 
end 

v_new = [vx,vy,vz];
v_new_norm = v_new ./ norm(v_new);  

end

