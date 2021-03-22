function [M,Minv] = MRT_Matrix(dimen,dis_velo,scheme)
%MRT_MATRIX Set Matrix distribution to momentum space transformation
% ---INPUT PARAMETERS---
% dimen   --> dimension, 2 or 3,D (numerical value)
% dis_velo--> number of discrete velocities (numerical value) 
% scheme  --> 1 opt: MRT-GS MRT Grand-Schmidt 
% 
% ---OUTPUT PARAMETERS---
% M       --> transformation matrix
% Minv    --> Inverse of transformation matrix
%
% ---COMMENTS---
% When use 3D is necessary to specify dimension 3 in optional arguments
%
% The matrices are based on section 10.4.2 for 2D MRT and Appendix A.6 
% (page 669-672) for 3D MRT.
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
elseif dimen == 3
    switch scheme
        case 'MRT-GS'
            if dis_velo == 15
                M = [ 1  1  1  1  1  1  1  1  1  1  1  1  1  1  1;
                     -2 -1 -1 -1 -1 -1 -1  1  1  1  1  1  1  1  1;
                     16 -4 -4 -4 -4 -4 -4  1  1  1  1  1  1  1  1;
                      0  1 -1  0  0  0  0  1 -1  1 -1  1 -1 -1  1;
                      0 -4  4  0  0  0  0  1 -1  1 -1  1 -1 -1  1;
                      0  0  0  1 -1  0  0  1 -1  1 -1 -1  1  1 -1;
                      0  0  0 -4  4  0  0  1 -1  1 -1 -1  1  1 -1;
                      0  0  0  0  0  1 -1  1 -1 -1  1  1 -1  1 -1;
                      0  0  0  0  0 -4  4  1 -1 -1  1  1 -1  1 -1;
                      0  2  2 -1 -1 -1 -1  0  0  0  0  0  0  0  0;
                      0  0  0  1  1 -1 -1  0  0  0  0  0  0  0  0;
                      0  0  0  0  0  0  0  1  1  1  1 -1 -1 -1 -1;
                      0  0  0  0  0  0  0  1  1 -1 -1 -1 -1  1  1;
                      0  0  0  0  0  0  0  1  1 -1 -1  1  1 -1 -1;
                      0  0  0  0  0  0  0  1 -1 -1  1 -1  1 -1  1];
                Minv = inv(M);
            elseif dis_velo == 19
                M = [  1   1   1   1   1   1   1  1  1  1  1  1  1  1  1  1  1  1  1;
                     -30 -11 -11 -11 -11 -11 -11  8  8  8  8  8  8  8  8  8  8  8  8;
                      12  -4  -4  -4  -4  -4  -4  1  1  1  1  1  1  1  1  1  1  1  1;
                       0   1  -1   0   0   0   0  1 -1  1 -1  0  0  1 -1  1 -1  0  0;
                       0  -4   4   0   0   0   0  1 -1  1 -1  0  0  1 -1  1 -1  0  0;
                       0   0   0   1  -1   0   0  1 -1  0  0  1 -1 -1  1  0  0  1 -1;
                       0   0   0  -4   4   0   0  1 -1  0  0  1 -1 -1  1  0  0  1 -1;
                       0   0   0   0   0   1  -1  0  0  1 -1  1 -1  0  0 -1  1 -1  1;
                       0   0   0   0   0  -4   4  0  0  1 -1  1 -1  0  0 -1  1 -1  1;
                       0   2   2  -1  -1  -1  -1  1  1  1  1 -2 -2  1  1  1  1 -2 -2;
                       0  -4  -4   2   2   2   2  1  1  1  1 -2 -2  1  1  1  1 -2 -2;
                       0   0   0   1   1  -1  -1  1  1 -1 -1  0  0  1  1 -1 -1  0  0;
                       0   0   0  -2  -2   2   2  1  1 -1 -1  0  0  1  1 -1 -1  0  0;
                       0   0   0   0   0   0   0  1  1  0  0  0  0 -1 -1  0  0  0  0;
                       0   0   0   0   0   0   0  0  0  0  0  1  1  0  0  0  0 -1 -1;
                       0   0   0   0   0   0   0  0  0  1  1  0  0  0  0 -1 -1  0  0;
                       0   0   0   0   0   0   0  1 -1 -1  1  0  0  1 -1 -1  1  0  0;
                       0   0   0   0   0   0   0 -1  1  0  0  1 -1  1 -1  0  0  1 -1;
                       0   0   0   0   0   0   0  0  0  1 -1 -1  1  0  0 -1  1  1 -1];
                Minv = inv(M);
            end
    end
end
end


