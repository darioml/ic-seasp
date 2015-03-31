function [ y, e, a ] = gass_lms( x, gassType, ro, alpha )
%GASS_LMS Implement GASS LMS
%   Detailed explanation goes here

    N = length(x); % number of iterations
    
    e = zeros(1,N);
    y = zeros(1,N);
    mu= zeros(1,N);
    phi=zeros(2,N);
    
    a = zeros(N,2);
    
    e(1) = x(1);
    e(2) = x(2);
    e(3) = x(3);
    
    for m=4:N-1
        xnow = [x(m-1) x(m-2)];
        xprev= [x(m-2) x(m-3)];
        y(m) = a(m,:) * xnow';
        e(m) = x(m) - y(m);
        
        a(m+1,:) = a(m,:) + mu(m)*e(m)*xnow;
        
        switch gassType
            case 1
                phi(:, m) = ( eye(2) - mu(m-1)*(xprev')*xprev )*phi(:,m-1) + e(m-1)*xprev';
            case 2
                phi(:, m) = alpha*phi(:, m-1) + e(m-1)*xprev';
            case 3
                phi(:, m) = e(m-1)*xprev';
        end
        mu(m+1) = mu(m) + ro*e(m)*xnow*phi(:,m);
        
    end
    
end

