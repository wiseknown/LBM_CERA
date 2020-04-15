function [f,eq,u,v,rho,cx,cy] = VarSetUp(n,m,dimen,dis_velo)
%INITIAL Set up the initial variables of the model
% ---INPUT PARAMETERS---
% n       --> number of nodes on x coord
% m       --> number of nodes on y coord
% dimen   --> dimension, 2 or 3,D (numerical value)
% dis_velo--> number of discrete velocities (numerical value) 
%
% ---OUTPUT PARAMETERS---
% f       --> distribution functions per each node (x,y,..) dimension
% eq      --> equilibrium distribution functions or momentum equilibrium functions
%             per each node
% v       --> y axis velocity field (not macroscopic)
% u       --> x axis velocity field (not macroscopic)
% rho     --> density field (not macroscopic)

if dimen == 2
    f   = zeros(dis_velo,n*m);
    eq = zeros(dis_velo,n*m);
    v   = zeros(1,n*m);
    u   = zeros(1,n*m);
    rho = ones(1,n*m);
    switch dis_velo
        case 9
            cx = [0, 1, 0, -1, 0, 1, -1, -1, 1];
            cy = [0, 0, 1, 0, -1, 1, 1, -1, -1];
    end
else
    %para casos de 3D 
end
end

