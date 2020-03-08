# MonteCarloSimulation-PhotonMigration
Purpose: 
Conducted Monte Carlo simulation on photon migration in a grid domain. The light source is simulated using a pencil beam, with initial position at (x=10, y=10.5, z=0.0), pointing along z-axis (vx=0, vy=0, vz=1). The domain is a uniform medium with ua = 0.1/mm, us = 1/mm, g=0.8, n=1.33. The photon scattering direction is determined using Rayleigh scattering phase function. The scattering angle is obtained using Inverse Distribution Method (IDM). Time-resolved fluence distribution plot was simulated with 10^5 photons, starting from 0 to 1ns. 


% For first time users, please run MonteCarloSimulation.m 
% 
% Main Function:
%     MonteCarloSimulation.m : Main program for Monte Carlo Simulation
% Supporting Functions:
%     onemove_in_cube.m: find the shortest distance to intersect
%                        with a voxel wall
%     onescattering.m:   single scattering before photon change its
%                        scattering direction 
%     scattering_dir.m:  determine the Rayleigh distribution scattering angle 
%     oneSimulation.m:   MCS with only one photon packet.
%     Rayleigh_test.m:   test file for testing the distribution of 
%                        simulated scattering angle 
