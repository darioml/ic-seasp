function [ weights, weights2, error, pred_out ] = p4_aclms_ar( input, order, mu )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes here
    input = input(:);
    
    N = length(input); % number of iterations
    
    error    = zeros(N,1); %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    weights  = zeros(order,N);
    weights2  = zeros(order,N);
    
    for m=order+1:N
        pred_out(m) = (weights(:,m)') * input(m-1:-1:m-order) + (weights2(:,m)') * conj(input(m-1:-1:m-order));
        error(m)    = input(m) - pred_out(m);
        weights(:,m+1) = weights(:,m) + (mu*conj(error(m))*input(m-1:-1:m-order));
        weights2(:,m+1) = weights2(:,m) + (mu*conj(error(m))*conj(input(m-1:-1:m-order)));
    end
    
    weights = conj(weights);
    weights2 = conj(weights2);
end

