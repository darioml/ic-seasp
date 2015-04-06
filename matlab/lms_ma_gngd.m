function [ weights, error, pred_out ] = lms_ma_gngd( in, out, order, mu, ro )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes here

    N = length(out); % number of iterations
    
    error    = out; %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    epsilon  = zeros(1,N);
    
    weights  = zeros(N,order);
    
    for m=order+2:N
        pred_out(m) = weights(m,:) * in(m-1:-1:m-order)';
        error(m)    = out(m) - pred_out(m);
        weights(m+1,:) = weights(m,:) +    (1/(epsilon(m) + (in(m-1:-1:m-order)'*in(m-1:-1:m-order)) ))*error(m)*in(m-1:-1:m-order);
        epsilon(m+1)   = epsilon(m) - ((ro*mu*error(m)*error(m-1)* ( (in(m-1:-1:m-order)' * in(m-2:-1:m-order-1) )  ))   /    ( (epsilon(m-1) + (in(m-2:-1:m-order-1)')*in(m-2:-1:m-order-1)  )^2 )    );
    end
end

