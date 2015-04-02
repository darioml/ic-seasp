function [ weights, error, pred_out ] = lms_ma_gss( in, out, order, gassType, ro, alpha )
%LMS_MA Summary of this function goes here
%   Detailed explanation goes here

    N = length(out); % number of iterations
    
    error    = out; %initially, the error is equal to the output!
    pred_out = zeros(1,N);
    mu       = zeros(1,N);
    phi      = zeros(order,N);
    
    weights  = zeros(N,order);
    
    for m=order+2:N
        xnow = in(m-1:-1:m-order);
        xprev= in(m-2:-1:m-order-1);
        
        pred_out(m) = weights(m,:) * in(m-1:-1:m-order)';
        error(m)    = out(m) - pred_out(m);
        weights(m+1,:) = weights(m,:) + mu(m)*error(m)*in(m-1:-1:m-order);
        
        switch gassType
            case 1
                phi(:, m) = ( eye(order) - mu(m-1)*(xprev')*xprev )*phi(:,m-1) + error(m-1)*xprev';
            case 2
                phi(:, m) = alpha*phi(:, m-1) + error(m-1)*xprev';
            case 3
                phi(:, m) = error(m-1)*xprev';
        end
        mu(m+1) = mu(m) + ro*error(m)*xnow*phi(:,m);
        
    end
end

