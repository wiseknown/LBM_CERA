function [MM] = Momentum(dimen,dis_velo,f,M)
% MOMENTUM update all momentums
% 
% 
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
% MM      --> contains all the moments of the distribution functions 
%
%
if dimen == 2
    switch dis_velo
        case 5
            %D2Q5 models implementation
        case 9
            MM = M*f;
    end
else
    %para casos de 3D 
end
end