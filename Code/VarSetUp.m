function [f,eq,u,v,rho,cx,cy,cz] = VarSetUp(f_nodes,dis_velo,varargin)
%INITIAL Set up the initial variables of the model
% ---INPUT PARAMETERS---
% f_nodes --> number of fluid nodes in the media
% dis_velo--> number of discrete velocities (numerical value) 
% dimen   --> dimension, 2 or 3,D (numerical value) - Optional Argument
% 
% ---OUTPUT PARAMETERS---
% f       --> distribution functions per each fluid node (x,y,..) dimension
% eq      --> equilibrium distribution functions or momentum equilibrium 
%             functions per each node 
% v       --> y axis velocity field (not macroscopic)
% u       --> x axis velocity field (not macroscopic)
% rho     --> density field (not macroscopic)
%
% ---COMMENTS---
% When use 3D is necessary to specify dimension 3 in optional arguments
%


f   = zeros(dis_velo,f_nodes);
eq  = zeros(dis_velo,f_nodes);
v   = zeros(1,f_nodes);
u   = zeros(1,f_nodes);
rho = ones(1,f_nodes);

if size(varargin) == 0
    switch dis_velo
        case 9
            cx = [0, 1, 0, -1, 0, 1, -1, -1, 1];
            cy = [0, 0, 1, 0, -1, 1, 1, -1, -1];
    end
else
    switch dis_velo
        case 15
            cx = [0, 1, 0, -1, 0, 1, -1, -1, 1];
            cy = [0, 1, 0, -1, 0, 1, -1, -1, 1];
            cz = [0, 0, 1, 0, -1, 1, 1, -1, -1];
    end
end

end

