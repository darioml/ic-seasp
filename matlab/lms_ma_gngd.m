function [ weights, error, pred_out ] = lms_ma_gngd( in, out, order, mu, ro )
    in = in(:); 
    out =out(:);

    N = length(out); % number of iterations
    
    error    = zeros(1,N);
    pred_out = zeros(1,N);
    epsilon  = ones(1,N);
    
    weights  = zeros(order,N);
    
    for m=order+2:N
        xnow = in(m:-1:m-order+1);
        xprev= in(m-1:-1:m-order);

        pred_out(m) = weights(:,m)' * xnow;
        error(m)    = out(m) - pred_out(m);

        weights(:,m+1) = weights(:,m) +  (1/( epsilon(m) + (xnow'*xnow) ))*error(m)*xnow;
        epsilon(m+1)   = epsilon(m) - ((ro*mu*error(m)*error(m-1)* ( xnow' * xprev )  )   /    ( (epsilon(m-1) + ((xprev')*xprev)  )^2 )    );
    end
end

