function [f] = StdInitialization(f,eq,scheme,Minv)
%StdInitialization --> Assure the initial values of the distribution 
%                      functions. f = feq, u = 0 (except inlet or others),
%                      and rho = 1
%---INPUT PARAMETER---
% f       --> distribution functions in each fluid node
% eq      --> equilibrium moment storage
% scheme  --> 1 opt: MRT-GS MRT Grand-Schmidt
% Minv    --> Inverse of transformation matrix
%
%---OUTPUT PARAMETERS---
% f ---> distribution functions in each fluid node with initial values 
%        according to references. 
%
%--- REFERENCES ---
% Sec 3.3.1 and Sec 5.1 of [1]
% [1] Krüger, T., Kusumaatmaja, H., Kuzmin, A., Shardt, O., Silva, G., 
%     & Viggen, E. M. (2017). The lattice Boltzmann method. Springer 
%     International Publishing, 10, 978-3.

switch scheme
    case 'BGK'
        f(:,:) = eq; %to verify whether it is necessary to add collision
        %coefficient
    case 'MRT-GS'
        f(:,:) = Minv*eq;
end

end

