function [M,Minv] = MRT_Matrix(dimen,dis_velo,scheme)
%MRT_MATRIX Set Matrix distribution to momentum space transformation
%   Detailed explanation goes here
if dimen == 2
    switch scheme
        case 'MRT-GS'
            if dis_velo==9
                M = [ 1  1  1  1  1  1  1  1  1;
                     -4 -1 -1 -1 -1  2  2  2  2;
                      4 -2 -2 -2 -2  1  1  1  1;
                      0  1  0 -1  0  1 -1 -1  1;
                      0 -2  0  2  0  1 -1 -1  1;
                      0  0  1  0 -1  1  1 -1 -1;
                      0  0 -2  0  2  1  1 -1 -1;
                      0  1 -1  1 -1  0  0  0  0;
                      0  0  0  0  0  1 -1  1 -1];
                Minv = inv(M);
            end
    end
end
end

