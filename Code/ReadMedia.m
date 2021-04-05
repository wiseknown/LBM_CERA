function [f_nodes,Logic_M] = ReadMedia(file_media,m,n,o)
%ReadMedia --> Read csv file with coordinates and count fluid nodes and 
%creates a logic matrix of locations in 3D or 2D
%
%---INPUT PARAMETER---
% file_media---> name of csv file ordered for each location of point solid 
%                in x,y,z format and discrete units. The array size is
%                solid_nodes x 3 in 3D or solid_nodes x 2 in 2D. 
% n,m,o     ---> Size in discrete units (lattice units) of the media 
%
%---OUTPUT PARAMETERS---
% f_nodes   ---> number of fluid nodes in the media
% Logic_M   ---> logic matrix of locations in 3D array

    Loc = csvread(file_media);
    [m_nodes,~] = size(Loc); 
    f_nodes = n*m*o - m_nodes;
    
    Logic_M = ones(m,n,o);
    for i = 1:m_nodes
        Logic_M(Loc(i,1)+1,Loc(i,2)+1,Loc(i,3)+1) = 0;
    end
    
    Logic_M = logical(Logic_M);
end