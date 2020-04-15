function [eq] = Equilibrium(eq,rho,u,v,dimen,dis_velo,scheme)
%EQUILIBRIUMDIST Provides the equilibrium distribution function for BGK and
%MRT Grand Schmidt schemes
%
%
%--- OUTPUT ---
% eq ---> represents equilibrium distributions for BGK case 
%         and momentum equilibrium functions for MRT case
%--- REFERENCES ---
% [1] Krüger, T., Kusumaatmaja, H., Kuzmin, A., Shardt, O., Silva, G., 
%     & Viggen, E. M. (2017). The lattice Boltzmann method. Springer 
%     International Publishing, 10, 978-3.
if dimen == 2
    switch scheme
        case 'BGK'
            if dis_velo == 9
                % c_s^2 = 1/3 (non dimensionalization)
                % Taken from [1], pag. 93
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
        case 'MRT-GM'
            if dis_velo == 9
                % c_s^2 = 1/3 (non dimensionalization)
                % Taken from [1], pag. 421
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
end
end

