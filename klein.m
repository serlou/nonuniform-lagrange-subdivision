function [x,y,z] = klein(u,v,r)
% Bagel immersion of the Klein bottle
% u - parameters in [0,4*pi]
% v - parameters in [0,pi]
% r - radius of the bagel, r>2

r1 = (r+cos(u./2).*sin(v)-sin(u./2).*sin(2.*v));

x = r1.*cos(u);
y = r1.*sin(u);
z = sin(u./2).*sin(v)+cos(u./2).*sin(2.*v);
end