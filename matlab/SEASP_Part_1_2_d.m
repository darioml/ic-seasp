clear all
close all

M = 10;
L = 256;

x = zeros(L,1);
for l=1:M
    x(l) = p1_rk(l-1,M);
end
for l=(L-M+1):L
    x(l) = p1_rk(l-L-1,M);
end

figure;
subplot(121);
plot(x); xlim([0 256])
title('Circ-shifted ACF, M=10, L=256');
ylabel('r(k)')
xlabel('Index (k)');

subplot(122);
plot(-128:127,real(fftshift(fft(x))));xlim([-128 127])
title('FFT of Circ-shifted ACF, M=10, L=256');
ylabel('$|R(k)|$')
xlabel('Index (k)');
