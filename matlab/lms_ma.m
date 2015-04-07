function [ weights, error, pred_out ] = lms_ma( in, out, order, mu )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes here

    N = length(out); % number of iterations
    
    error    = out; %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    
    weights  = zeros(N,order);
    
    for m=order+1:N
        pred_out(m) = weights(m,:) * in(m:-1:m-order+1)';
        error(m)    = out(m) - pred_out(m);
        weights(m+1,:) = weights(m,:) + mu*error(m)*in(m:-1:m-order+1);
    end
end

