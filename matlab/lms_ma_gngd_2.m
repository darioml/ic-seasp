function [ weights, error, pred_out ] = lms_ma_gngd_2( in, out, order, mu, ro )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes here
    in = in(:);
    out = out(:);

    N = length(out); % number of iterations
    
    error    = out; %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    epsilon  = zeros(1,N);
    
    weights  = zeros(order,N);
    
    for m=order+2:N
        x_now = in(m-1:-1:m-order);
        x_prev= in(m-2:-1:m-order-1);

        pred_out(m) = weights(:,m)' * x_now;
        error(m)    = out(m) - pred_out(m);

        weights(:,m+1) = weights(:,m) +  (1/(epsilon(m)+(x_now'*x_now)))*error(m)*x_now;

        epsilon(m+1)   = epsilon(m) - ro*mu*( (error(m)*error(m-1)*(x_now'*x_prev))  /  (epsilon(m-1) + (x_prev'*x_prev)) );
    end
end

