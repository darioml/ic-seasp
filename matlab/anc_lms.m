function [ weights, error, pred_out ] = anc_lms( signal, est_error, mu, order )
    signal   = signal(:);
    est_error= est_error(:);
%     pred_error=pred_error(:);
    N        = length(signal);
    
    weights  = zeros(order, N);
    pred_out = zeros(1, N);
    error    = zeros(1, N);
    
    for n=order:N
        u            = est_error(n:-1:n-order+1);
        
        pred_out(n)  = weights(:,n)'*u;
        error(n)     = signal(n) - pred_out(n);
        weights(:, n+1) = weights(:, n) + mu*error(n)*u;
    end

end

