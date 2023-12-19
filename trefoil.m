function [x, y, z] = trefoil(u, v, r)
% A surface describing a trefoil knot
% INPUT: u, v - Parameters in the range [0, 2*pi]
%        r - Radius of the tube, r>0

x = r * sin(3 * u) ./ (2 + cos(v));
y = r * (sin(u) + 2 * sin(2 * u)) ./ (2 + cos(v + pi * 2 / 3));
z = r / 2 * (cos(u) - 2 * cos(2 * u)) .* (2 + cos(v)) .* (2 + cos(v + pi * 2 / 3)) / 4;
end