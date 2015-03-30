function [ y,e,a ] = SEASP_Part_3_lms( x, mu, p )
%SEASP_PART_3_LMS Summary of this function goes here
%   Detailed explanation goes here

    N = length(x);
    
    e = zeros(N, 1);
    y = zeros(N, 1);
    
    a = zeros(p, N);
    
    for m=p+1:N % we need to start at order, so that we have enough x values to make use of the algorithm
        y(m) = a(:,m)' * x( m-1:-1:m-p );
        e(m) = x(m) - y(m);
        a(:, m+1) = a(:,m) + mu*e(m)*x( m-1:-1:m-p );
    end
end
