function [ weights, error, pred_out ] = p4_clms( in, out, order, mu )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes here
    in = in(:);
    out= out(:);
    
    N = length(out); % number of iterations
    
    error    = zeros(N,1); %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    weights  = zeros(order,N);
    
    for m=order+1:N
        pred_out(m) = (weights(:,m)') * in(m-1:-1:m-order);
        error(m)    = out(m) - pred_out(m);
        weights(:,m+1) = weights(:,m) + (mu*conj(error(m))*in(m-1:-1:m-order));
    end
end

