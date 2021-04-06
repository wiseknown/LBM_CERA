function [u] = SetInputVelocity(plane,u0,u,m,n,o)
%SetInputVelocity --> Set one coordinate input velocity in a plane
%                     selected in the fluid nodes. 
%
%---INPUT PARAMETER---
% plane     ---> Plane in where the input velocity is set. These have
%                six possible strings: xy1,xy2,xz1,xz2,yz1,yz2. The two
%                first letters indicate the plane and the number 1 
%                indicates the plane nearest to the origin and 2 farthest
%                from the origin. 
% u         ---> the velocity coordinate vector set up previously 
% u0        ---> the values of velocity 
% n,m,o     ---> Size in discrete units (lattice units) of the media 
%
%---OUTPUT PARAMETERS---
% u         ---> the velocity coordinate vector with the input velocity set
switch plane
    case 'xy1'
        
    case 'xy2'
    case 'xz1'
    case 'xz2'
    case 'yz1'
    case 'yz2'
end


 
end

