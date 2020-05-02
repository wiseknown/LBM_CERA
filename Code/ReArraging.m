function [f] = ReArraging(f,dis_velo,n,m)
%REARRAGING Summary of this function goes here
%   Detailed explanation goes here
    f = permute(f,[3,1,2]);
    f = reshape(f,[dis_velo,n*m]);
    
end

