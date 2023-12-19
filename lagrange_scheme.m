function [ f1,t1 ] = lagrange_scheme(f,t,n_steps,degree)
% Lagrange-type non-interpolatory non-uniform subdivision scheme
% INPUT: f - matrix of size n x m, where m is the number of points in R^n
%        t - vector of size m, representing the grid
%        n_steps - refinement steps
%        degree >= 1 - polynomial degree of the Lagrange interpolation
%           formula
% OUTPUT: f1 - matrix of size n x ( 2*degree + 2^n_steps ( m - 2*degree )),
%               which is the result of n_steps refinement steps of the
%               input data f.
%         t1 - vector of size ( 2*degree + 2^n_steps ( m - 2*degree ) ),
%               which is the result of n_steps refinement steps with the
%               grid scheme of the grid t.

if n_steps>0
    t1 = grid_scheme(t,1,degree);  % refine the grid
    f1 = zeros([size(f,1),2*(size(f,2)-degree)],'like',f); % preallocate memory
    for i=1:size(f,2)-degree
        for j=0:degree
            aux = 1;
            for k = 0:degree
                if j~= k
                    aux = aux .* (t(i+k)-t1([2*i-1,2*i]))/(t(i+k)-t(i+j));
                end
            end
            f1(:,[2*i-1,2*i]) = f1(:,[2*i-1,2*i]) + f(:,i+j)*aux;
        end
    end
    f1 = lagrange_scheme(f1,t1,n_steps-1,degree);
else
    f1 = f;
    t1 = t;
end
end

function [ f1 ] = grid_scheme( f,n_steps,degree )
% Subdivision scheme for the grid. Here we use the Chaikin's scheme,
% but any convergente strictly monotonicity preserving scheme can be used.

if n_steps>0
    f1 = zeros(size(f,1),2*(size(f,2)-degree),'like',f);%preallocate memory
    j = floor(degree/2)+1;
    for i=1:size(f,2)-degree
        ff = f(:,i:i+degree); % for each (degree+1)-point stencil
        f1(:,2*i-1) = (3*ff(:,j)+ff(:,j+1))/4;
        f1(:,2*i) = (ff(:,j)+3*ff(:,j+1))/4;
    end
    f1 = grid_scheme(f1,n_steps-1,degree);
else
    f1 = f;
end
end