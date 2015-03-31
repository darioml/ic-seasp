% y - predicted x
% e - error
% a - est variables
function [y, e, a] = lms_test(x, mu)
%SEASP_PART_3_LMS Summary of this function goes here
%   Detailed explanation goes here

    % p = number of coefficients
    N = length(x); % number of iterations
    
    e = zeros(1,N);
    y = zeros(1,N);
    
    a = zeros(N,2);
    
    e(1) = x(1);
    e(2) = x(2);
    
    for m=3:N
        % not sure I agree with this.
        y(m) = a(m,:) * [x(m) x(m-1)]';
        e(m) = x(m) - y(m);
        a(m+1,:) = a(m,:) + mu*e(m)*[x(m) x(m-1)];
    end
end
