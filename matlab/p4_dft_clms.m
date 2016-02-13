function [ weights, error, pred_out ] = p4_dft_clms( y, x, mu )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes herex
    y = y(:);
    N = length(y);
    
    error    = zeros(N,1); %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    weights  = zeros(N,N);
    
    for n=1:N
        pred_out(n) = (weights(:,n)') * x(:,n);
        error(n)    = y(n) - pred_out(n);
        weights(:,n+1) = weights(:,n) + mu*(conj(error(n))*x(:,n));
    end
end

