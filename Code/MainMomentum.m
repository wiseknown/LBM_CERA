function [outputArg1,outputArg2] = MainMomentum(dimen,dis_velo,f,rho,u,v)
% MAINMOMENTUM update rho (density),j_x x momentum, j_y y momentum
% j_x = u*rho, j_y = v*rho
% u y v are lattice velocities in x and y respectively
% 
%---INPUT PARAMTERS---
% dimen   --> dimension, 2 or 3,D (numerical value)
% dis_velo--> number of discrete velocities (numerical value) 
% f       --> distribution functions per each node (x,y,..) dimension
% v       --> y axis velocity field (not macroscopic)
% u       --> x axis velocity field (not macroscopic)
% rho     --> density field (not macroscopic)

%---OUTPUT PARAMETERS---
% 
%
%
outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

