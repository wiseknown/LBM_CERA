function [f,eq,vel,rho,cx,cy,cz] = VarSetUp(f_nodes,dis_velo,varargin)
%INITIAL Set up the initial variables of the model
%
% ---INPUT PARAMETERS---
% f_nodes --> number of fluid nodes in the media
% dis_velo--> number of discrete velocities (numerical value) 
% dimen   --> dimension, 2 or 3,D (numerical value) - Optional Argument
% 
% ---OUTPUT PARAMETERS---
% f       --> distribution functions per each fluid node (x,y,..) dimension
% eq      --> equilibrium distribution functions or momentum equilibrium 
%             functions per each node 
% vel     --> Cell type compose from velocity in x (u), velocity in y (v)
%             and velocity in z (w) 
% rho     --> density field (not macroscopic)
%
% ---COMMENTS---
% When use 3D is necessary to specify dimension 3 in optional arguments
%
% The velocity sets are put according to [1], section 3.4.7.3, page 88-89

f   = zeros(dis_velo,f_nodes);
eq  = zeros(dis_velo,f_nodes);
vel{1} = zeros(1,f_nodes); %u velocity field
vel{2} = zeros(1,f_nodes); %v velocity field
rho = ones(1,f_nodes);
size(varargin)
if size(varargin) == 0
    switch dis_velo
        case 9
            cx = [0, 1, 0, -1, 0, 1, -1, -1, 1];
            cy = [0, 0, 1, 0, -1, 1, 1, -1, -1];
    end
else
    vel{3} = zeros(1,f_nodes); %w velocity field
    switch dis_velo
        case 15
            cx = [0, 1,-1, 0, 0, 0, 0, 1,-1, 1,-1, 1,-1,-1, 1];
            cy = [0, 0, 0, 1,-1, 0, 0, 1,-1, 1,-1,-1, 1, 1,-1];
            cz = [0, 0, 0, 0, 0, 1,-1, 1,-1,-1, 1, 1,-1, 1,-1];
        case 19
            cx = [0, 1,-1, 0, 0, 0, 0, 1,-1, 1,-1, 0, 0, 1,-1, 1,-1, 0, 0];
            cy = [0, 0, 0, 1,-1, 0, 0, 1,-1, 0, 0, 1,-1,-1, 1, 0, 0, 1,-1];
            cz = [0, 0, 0, 0, 0, 1,-1, 0, 0, 0,-1, 1,-1, 0, 0,-1, 1,-1, 1];
    end
end
end

