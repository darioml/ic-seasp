clear all
close all

M = 10;
L = 256;

x = zeros(L,1);
for l=1:(M-1)
    x(l) = p1_rk(l-M,M);
end
for l=(M):(2*M)
    x(l) = p1_rk(l-M-1,M);
end

stem(x)

% plot(imag(fft(x)))