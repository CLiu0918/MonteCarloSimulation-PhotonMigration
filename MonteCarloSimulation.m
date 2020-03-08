% Chang Feb 20
% stimulate Monte Carlo in a 3D cube with a pencile beam source 
% optical properties of the cube:
% hemogeneous: us = 1 mm^-1;   ua = 0.1 mm^-1 ;  g=0.8;  n=1.33;
% simulate 10^5 photons 
% simulate photon between 0 to  1 ns, i.e. 1:100 unit in the content (10e-11 s)
% the time for a photon pass by 1mm cube is 0.01 ns 


%% simulation Intialization
clc
clear all
ua=0.1; 
us=1;
g=0.8; 
n=1.33;
np = 0.5*10^6;    % Total number of photon
npSub = 1000;  % Launch 1000 photon each time 
itr = np/npSub;  % Iteration times
c =299792458000.00;  % mm/s
speed =  c/n;  
p0 = [10.5, 10.5, 0];   % Initial launch position 
p=p0;
nx = 20;
ny = 20; 
nz = 20; 
v = [0, 0, 1];    % Initial scattering direction 
v_norm = v./norm(v);         % Normalize the vector
Fluence = zeros(20,20,20);   % Initialized Fluence 
%% MC simulation 
S = -log(rand());   % Random unit-less scattering length 
time = 0; % Set up the initial time 
tic
for count = 1: itr
    count
    [Fluence_one,timeSub] = oneSimulation(p,v,S,us,ua,npSub,speed);  
    time = time + timeSub;
    Fluence = Fluence+Fluence_one;   
    if time > 10e-9
       disp('Time limits exceeds');
         break
    end
end
toc
Fluence = Fluence./(np*time);    % Normalize Fluence 
%% Plot the Fluence in x=11 and z=5 plane 
x = 1:1:20;
y =x;
z =x;
[x,y,z] = meshgrid(x,y,z);

figure (1)
xslice = 11;    % location of y-z planes
yslice=[];
zslice=[];
slice(x,y,z,log10(Fluence),xslice,yslice,zslice);
colorbar
xlabel('x','fontsize',14);
ylabel('y','fontsize',14);
zlabel('z','fontsize',14);
title('Fluence distribution at cross-section x=11 plane','fontsize',14);

figure(2)
xslice = [];
yslice =[];
zslice =5;
slice(x,y,z,log10(Fluence),xslice,yslice,zslice);
xlabel('x','fontsize',14);
ylabel('y','fontsize',14);
zlabel('z','fontsize',14);
colorbar
title('Fluence distribution at cross-section z=5 plane','fontsize',14);
























