function [f] = CollesionBGK2D(f,eq,S)
% COLLESION Collesion process
%   Detailed explanation goes here
    f = S.*eq  + (1 - S).*f;
end

