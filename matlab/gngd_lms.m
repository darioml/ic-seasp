function [ y,e,a ] = gngd_lms( x, ro, mu )
%GNGD Summary of this function goes here
%   Detailed explanation goes here

    N = length(x); % number of iterations
    
    e = zeros(1,N);
    y = zeros(1,N);
    er= zeros(1,N);
    
    a = zeros(N,1);
    
    e(1) = x(1);
    e(2) = x(2);
    
    for m=3:N-1
        xnow = x(m-1);
        xprev= x(m-2);
        y(m) = a(m,:) * xnow';
        e(m) = x(m) - y(m);
        
        a(m+1,:) = a(m,:) + (mu/(er(m)+xnow*xnow'))*e(m)*xnow';
        
        er(m+1) = er(m) - ro*mu*((e(m)*e(m-1)*xnow*xprev')/(er(m-1)+xprev*xprev')^2);
    end
    
end

