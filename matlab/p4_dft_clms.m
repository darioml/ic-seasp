function [ weights, error, pred_out ] = p4_dft_clms( input )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes herex
 
    [order,N] = size(input); % number of iterations
    
    error    = zeros(N,1); %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    weights  = zeros(order,N);
    
    for m=order+1:N
        pred_out(m) = (weights(:,m)') * input(:,m);
        error(m)    = input(m) - pred_out(m);
        weights(:,m+1) = weights(:,m) + (conj(error(m))*input(:,m));
    end
end

