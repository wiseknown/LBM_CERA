function [f] = Streaming(f,dis_velo,cx,cy,n,m)
%STREAMING Streaming function depends on number of discrete velocities in
%this case it just able to do it in 2D
% f output is rearraging to n x m x dis_velo in 3D 
% After setting BC you should use function ReArraging to reorder the nodes 
%   cx and cy are setting in the VarSetUp function
    f = reshape(f,[dis_velo,n,m]);
    f = permute(f,[2,3,1]);
    for i=2:dis_velo
        f(:,:,i)=circshift(f(:,:,i),[cx(i), cy(i), 0]);
    end
end

