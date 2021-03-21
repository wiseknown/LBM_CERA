function [S] = CollesionPar(scheme,dimen,dis_velo)
%COLLESIONPAR Summary of this function goes here
%   Detailed explanation goes here
if dimen == 2
    switch scheme
        case 'BGK'
            if dis_velo == 9
                S = [];
            end
        case 'MRT-GS'
            if dis_velo == 9
                S = [];
            end
    end
else
    %3d cases
end
end

