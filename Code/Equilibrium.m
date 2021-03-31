function [eq] = Equilibrium(rho,vel,dis_velo,dimen,scheme)
%Equilibrium --> Provides the equilibrium distribution function for BGK and
%MRT Grand Schmidt schemes in 2 and 3 dimensions
%
%---INPUT PARAMETER---
% rho     --> density field 
% vel     --> Cell type compose from velocity in x (u), velocity in y (v)
%             and velocity in z (w)
% dis_velo--> number of discrete velocities (numerical value) 
% dimen   --> dimension, 2 or 3,D (numerical value) 
% scheme  --> 1 opt: MRT-GS MRT Grand-Schmidt
%
%---OUTPUT PARAMETERS---
% eq ---> represents equilibrium distributions for BGK case 
%         and momentum equilibrium functions for MRT case
%
%--- REFERENCES ---
% [1] Krüger, T., Kusumaatmaja, H., Kuzmin, A., Shardt, O., Silva, G., 
%     & Viggen, E. M. (2017). The lattice Boltzmann method. Springer 
%     International Publishing, 10, 978-3.

u = vel{1};
v = vel{2};

if dimen == 2
    switch scheme
        case 'BGK'
            if dis_velo == 9
                % c_s^2 = 1/3 (non dimensionalization)
                % Taken from [1], pag. 93
                % feq 
                uv_2 = u.^2 + v.^2;
                eq(1,:) = (2/9).*rho.*(2 - 3.*uv_2);
                eq(2,:) = (1/18).*rho.*(2 + 6.*u + 9.*(u.^2) - 3.*uv_2);
                eq(3,:) = (1/18).*rho.*(2 + 6.*v + 9.*(v.^2) - 3.*uv_2);
                eq(4,:) = (1/18).*rho.*(2 - 6.*u + 9.*(u.^2) - 3.*uv_2);
                eq(5,:) = (1/18).*rho.*(2 - 6.*v + 9.*(v.^2) - 3.*uv_2);
                eq(6,:) = (1/36).*rho.*(1 + 3.*(u + v) + 9.*u.*v + 3.*uv_2);
                eq(7,:) = (1/36).*rho.*(1 - 3.*(u - v) - 9.*u.*v + 3.*uv_2);
                eq(8,:) = (1/36).*rho.*(1 - 3.*(u + v) + 9.*u.*v + 3.*uv_2);
                eq(9,:) = (1/36).*rho.*(1 + 3.*(u - v) - 9.*u.*v + 3.*uv_2);
            end
        case 'MRT-GS'
            if dis_velo == 9
                % c_s^2 = 1/3 (non dimensionalization)
                % Taken from [1], pag. 421
                % equilibrium moments
                eq(1,:) = rho;
                eq(2,:) = rho.*(2 + 3.*(u.^2 + v.^2));
                eq(3,:) = rho.*(9.*(u.^2).*(v.^2) - 3.*(u.^2 + v.^2) + 1);
                eq(4,:) = rho.*u;
                eq(5,:) = rho.*u.*(3.*v.^2 - 1);
                eq(6,:) = rho.*v;
                eq(7,:) = rho.*v.*(3.*u.^2 - 1);
                eq(8,:) = rho.*(u.^2 - v.^2);
                eq(9,:) = rho.*u.*v;
            end
    end
else
    %3d cases
    w = vel{3};
    switch scheme
        case 'MRT-GS'
            if dis_velo == 15
                % c_s^2 = 1/3 (non dimensionalization)
                % Taken from [1], pag. 670
                % equilibrium moments
                eq(1,:) = rho;
                eq(2,:) = -rho + rho.*(u.^2 + v.^2 + w.^2);
                eq(3,:) = rho - 5.*rho.*(u.^2 + v.^2 + w.^2);
                eq(4,:) = rho.*u;
                eq(5,:) = (-7/3).*rho.*u;
                eq(6,:) = rho.*v;
                eq(7,:) = (-7/3).*rho.*v;
                eq(8,:) = rho.*w;
                eq(9,:) = (-7/3).*rho.*w;
                eq(10,:)= 2.*rho.*(u.^2) - rho.*((v.^2)+(w.^2));
                eq(11,:)= rho.*((v.^2)-(w.^2));
                eq(12,:)= rho.*u.*v;
                eq(13,:)= rho.*v.*w;
                eq(14,:)= rho.*u.*w;
                eq(15,:)= 0;
            elseif dis_velo == 19
                % c_s^2 = 1/3 (non dimensionalization)
                % Taken from [1], pag. 672
                % equilibrium moments
                eq(1,:) = rho;
                eq(2,:) = -11.*rho + 19.*rho.*(u.^2 + v.^2 + w.^2);
                eq(3,:) = 3.*rho - (11/2).*rho.*(u.^2 + v.^2 + w.^2);
                eq(4,:) = rho.*u;
                eq(5,:) = (-2/3).*rho.*u;
                eq(6,:) = rho.*v;
                eq(7,:) = (-2/3).*rho.*v;
                eq(8,:) = rho.*w;
                eq(9,:) = (-2/3).*rho.*w;
                eq(10,:)= 2.*rho.*(u.^2) - rho.*((v.^2)+(w.^2));
                eq(11,:)= -rho.*u.^2 + (1/2).*rho.*((v.^2)+(w.^2));
                eq(12,:)= rho.*(v.^2 - w.^2);
                eq(13,:)= (-1/2).*rho.*(v.^2 - w.^2);
                eq(14,:)= rho.*u.*v;
                eq(15,:)= rho.*v.*w;
                eq(16,:)= rho.*u.*w;
                eq(17,:)= 0;
                eq(18,:)= 0;
                eq(19,:)= 0;
            end
    end
end
end

