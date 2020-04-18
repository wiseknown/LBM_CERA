function [f] = StdInitialization(f,eq,scheme,dimen,Minv)
%STDINITIALIZATION Assure the initial values of the distribution funcions
%   
if dimen == 2
    switch scheme
        case 'BGK'
            f(:,:) = eq;
        case 'MRT-GS'
            f(:,:) = Minv*eq;
    end
end
end

