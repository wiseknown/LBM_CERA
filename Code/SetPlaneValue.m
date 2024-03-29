function [u] = SetPlaneValue(plane,u0,u,m,n,o,Logic_M)
%SetPlaneValue --> Set one coordinate input velocity (or other value)
%                  in a plane selected in the fluid nodes. 
%
%---INPUT PARAMETER---
% plane     ---> Plane in where the input velocity is set. These have
%                six possible strings: xy1,xy2,xz1,xz2,yz1,yz2. The two
%                first letters indicate the plane and the number 1 
%                indicates the plane nearest to the origin and 2 farthest
%                from the origin. 
% u         ---> the velocity coordinate vector or value set up previously 
% u0        ---> the values of velocity or other 
% n,m,o     ---> Size in discrete units (lattice units) of the media
% Logic_M   ---> logic matrix of locations in 3D array
%
%---OUTPUT PARAMETERS---
% u         ---> the velocity coordinate (or other) vector with 
%                the input velocity (or value) set
switch plane
    case 'xy1'
        temp_u = zeros(m,n,o);
        temp_u(Logic_M) = u;
        f_plane_nodes = false(m,n,o);
        f_plane_nodes(:,:,1) = Logic_M(:,:,1);
        temp_u(f_plane_nodes) = u0;
        u = temp_u(Logic_M)';
   
    case 'xy2'
        temp_u = zeros(m,n,o);
        temp_u(Logic_M) = u;
        f_plane_nodes = false(m,n,o);
        f_plane_nodes(:,:,o) = Logic_M(:,:,o);
        temp_u(f_plane_nodes) = u0;
        u = temp_u(Logic_M)';
        
    case 'xz1'
        temp_u = zeros(m,n,o);
        temp_u(Logic_M) = u;
        f_plane_nodes = false(m,n,o);
        f_plane_nodes(:,1,:) = Logic_M(:,1,:);
        temp_u(f_plane_nodes) = u0;
        u = temp_u(Logic_M)';
        
    case 'xz2'
        temp_u = zeros(m,n,o);
        temp_u(Logic_M) = u;
        f_plane_nodes = false(m,n,o);
        f_plane_nodes(:,n,:) = Logic_M(:,n,:);
        temp_u(f_plane_nodes) = u0;
        u = temp_u(Logic_M)';
        
    case 'yz1'
        temp_u = zeros(m,n,o);
        temp_u(Logic_M) = u;
        f_plane_nodes = false(m,n,o);
        f_plane_nodes(1,:,:) = Logic_M(1,:,:);
        temp_u(f_plane_nodes) = u0;
        u = temp_u(Logic_M)';
        
    case 'yz2'
        temp_u = zeros(m,n,o);
        temp_u(Logic_M) = u;
        f_plane_nodes = false(m,n,o);
        f_plane_nodes(m,:,:) = Logic_M(m,:,:);
        temp_u(f_plane_nodes) = u0;
        u = temp_u(Logic_M)';
end
 
end

