function [u] = SetVelocityField(type,u0,u)
%SETVELOCITYFIELD Set initial velocities and boundaries before
%initializations
%   Here are configured the initial velocity settings. There is not a
%   systematic way of aboard all different cases, so this function is
%   specific. Be careful to use. 
switch type
    case 'Input Velocity'
        u = reshape(u,[n,m]);
        u(1,:) = ones(1,m).*u0;
end 
end

