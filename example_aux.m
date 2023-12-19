function example_aux(f)
% Auxilary function to generate the examples
% INPUT: f - matrix of size n x m, where m is the number of points in R^n,
%           n = 2 or n = 3, describing a closed curve. f(:,1) must coincide
%           with f(:,end)

n_steps = 5;    % refinement levels

figure;
hold on;
if size(f,1) == 2
    show = @(f,opt) plot(f(1,:), f(2,:), opt, 'MarkerSize', 15, ...
        'LineWidth', 1.5);
else
    show = @(f,opt) plot3(f(1,:), f(2,:), f(3,:), opt, 'MarkerSize', 15,...
        'LineWidth', 1.5);
    view([45,45])
end

show(f,'.k');

f = [f(:,2:end),f(:,2:end),f(:,2:end)];
t = 1:size(f,2);


f1 = lagrange_scheme(f,t,n_steps,1);
show(f1,':b');

f1 = lagrange_scheme(f,t,n_steps,3);
show(f1,'-g');

f1 = lagrange_scheme(f,t,n_steps,5);
show(f1,'-.m');

axis equal;
axis on;
legend('Data','Degree 1','Degree 3','Degree 5')