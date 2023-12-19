% Just run this

close all;

N = 10;         % number of sampling points

r = 3;
T = 4*pi;
h = T/(N-1);

u = 0:h:T;
v = u/2;

[x,y,z] = klein(u, v, r);

f = [x;y;z];
example_aux(f);