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


%% Testing the linspace for small fft

clear all
close all

M = 10;
L = 50;

x = zeros(L,1);
for l=1:M
    x(l) = p1_rk(l-1,M);
end
for l=(L-M+1):L
    x(l) = p1_rk(l-L-1,M);
end

figure;
subplot(121);
plot(0:(L-1),x);xlim([0 L-1]);
title('Circ-shifted ACF, M=10, L=256');
ylabel('r(k)')
xlabel('Index (k)');

subplot(122);
w = linspace(-1, 1, L+1);
w = w(1:end-1);
plot(w, real(fftshift(fft(x))));
title('FFT of Circ-shifted ACF, M=10, L=256');
ylabel('$|R(k)|$')
xlabel('Index (k)');
