function [f] = CollesionMRT2D(eq,S,MM,Minv)
%   COLLESIONMRT2D Collesion process MRT 2D
%   S is a matrix with repetitions of the collision vector 
   
    f = Minv*(MM - S.*(MM - eq));
end

