function [ weights, weights2, error, pred_out ] = p4_aclms( in, out, order, mu )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes here
    in = in(:);
    out= out(:);
    
    N = length(out); % number of iterations
    
    error    = zeros(N,1); %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    weights  = zeros(order,N);
    weights2  = zeros(order,N);
    
    for m=order+1:N
        pred_out(m) = (weights(:,m)') * in(m:-1:m-order+1) + (weights2(:,m)') * conj(in(m:-1:m-order+1));
        error(m)    = out(m) - pred_out(m);
        weights(:,m+1) = weights(:,m) + (mu*conj(error(m))*in(m:-1:m-order+1));
        weights2(:,m+1) = weights2(:,m) + (mu*conj(error(m))*conj(in(m:-1:m-order+1)));
    end
end

