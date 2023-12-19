% Example to get the classical uniform non-interpolatory subdivision rules
% based on polynomial interpolation
clear; clc;

for degree = 1:2:5
    rule1 = sym(zeros(1,degree+1));
    rule2 = sym(zeros(1,degree+1));
    for i = 1:degree+1
        f = sym(zeros(1,degree+1));
        t = sym(1:degree+1);
        f(i) = 1;
        f1 = lagrange_scheme(f,t,1,degree);
        rule1(i) = f1(1);
        rule2(i) = f1(2);
    end
    degree
    rule1
    rule2
end