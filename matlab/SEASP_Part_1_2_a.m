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
subplot(221);
plot(x); xlim([0 256])
title('Circ-shifted ACF, M=10, L=256');
ylabel('r(k)')
xlabel('Index (k)');

subplot(223);
plot(-128:127,real(fftshift(fft(x))));xlim([-128 127])
title('FFT of Circ-shifted ACF, M=10, L=256');
ylabel('$|R(k)|$')
xlabel('Index (k)');



M = 128;
L = 256;

x = zeros(L,1);
for l=1:M
    x(l) = p1_rk(l-1,M);
end
for l=(L-M+1):L
    x(l) = p1_rk(l-L-1,M);
end

subplot(222);
plot(x); xlim([0 256])
title('Circ-shifted ACF, M=128, L=256');
ylabel('r(k)')
xlabel('Index (k)');

subplot(224);
plot(-128:127,real(fftshift(fft(x))));xlim([-128 127])
title('FFT of Circ-shifted ACF, M=128, L=256');
ylabel('$|R(k)|$')
xlabel('Index (k)');


%% show the shift

figure
M = 50;
L = 256;
subplot(121);
plot(-(L/2):((L/2)-1), p1_rk(-(L/2):((L/2)-1),M)); xlim([-(L/2) ((L/2)-1)])
title('ACF without circular shift, M=50, L=256');
xlabel('k')
ylabel('r(k)')

subplot(122);
x = zeros(L,1);
for l=1:M
    x(l) = p1_rk(l-1,M);
end
for l=(L-M+1):L
    x(l) = p1_rk(l-L-1,M);
end
plot(x); xlim([0 256])
title('ACF with circular shift, M=50, L=256');
xlabel('k')
ylabel('r(k)')