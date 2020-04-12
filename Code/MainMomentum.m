function [rho,u,v] = MainMomentum(dimen,dis_velo,f,rho,u,v)
% MAINMOMENTUM update rho (density),j_x x momentum, j_y y momentum
% j_x = u*rho, j_y = v*rho
% u y v are lattice velocities in x and y respectively
% 
%---INPUT PARAMTERS---
% dimen   --> dimension, 2 or 3,D (numerical value)
% dis_velo--> number of discrete velocities (numerical value) 
% f       --> distribution functions per each node (x,y,..) dimension
%             f must be in its 2-d form
% v       --> y axis velocity field (not macroscopic)
% u       --> x axis velocity field (not macroscopic)
% rho     --> density field (not macroscopic)

%---OUTPUT PARAMETERS---
% u,v and rho update one time step
%
%
if dimen == 2
    switch dis_velo
        case 5
            %D2Q5 models implementation
        case 9
            %auxM is a matrix composed of cx,cy and ones
            %rho,j_x, j_y is the column order
            auxM = [1, 1, 1,  1, 1, 1,  1,  1, 1;
                    0, 1, 0, -1, 0, 1, -1, -1, 1;
                    0, 0, 1, 0, -1, 1, 1, -1, -1];
            MM = auxM*f;
            rho = MM(1,:);
            u   = MM(2,:);
            v   = MM(3,:);  
    end
else
    %para casos de 3D 
end
end

