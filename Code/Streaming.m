function [f] = Streaming(f,dis_velo,cx,cy)
%STREAMING Streaming function depends on number of discrete velocities
%   cx and cy are setting in the VarSetUp function
    reshape(f,[9,n,m]);
    for i=2:dis_velo
        f(:,:,i)=circshift(f(:,:,i),[cx(i), cy(i), 0]);
    end
end

