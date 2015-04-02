function [ weights, error, pred_out ] = ale_lms( signal, mu, order, delta )
%ALE Summary of this function goes here
%   Detailed explanation goes here
    signal   = signal(:);
    N        = length(signal);
    
    weights  = zeros(order, N);
    pred_out = zeros(1, N);
    error    = zeros(1, N);
    
    for n=delta+order:N
        u            = signal(n-delta:-1:n-delta-order+1);
        
        pred_out(n)  = weights(:,n)'*u;
        error(n)     = signal(n) - pred_out(n);
        weights(:, n+1) = weights(:, n) + mu*error(n)*u;
    end

end

