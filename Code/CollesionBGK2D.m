function [f] = CollesionBGK2D(f,eq,S)
% COLLESION Collesion process
%   S is a integer that is the collesion parameter 
    f = S.*eq  + (1 - S).*f;
end

