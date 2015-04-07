clear all
close all

M = 128;
L = 256;

x = zeros(L,1);
for l=1:M
    x(l) = p1_rk(l-1,M);
end
for l=(L-M+1):L
    x(l) = p1_rk(l-L-1,M);
end


plot(imag(fft(x)))