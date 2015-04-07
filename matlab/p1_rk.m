function [ value ] = p1_rk( k,M )
%P1_RK Summary of this function goes here
%   Detailed explanation goes here
    if (abs(k) < M)
        value = (M-abs(k))/M;
    else
        value = 0;
    end
end

