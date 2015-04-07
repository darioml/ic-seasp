clear all
close all

x = p1_singen(24, 1000, 100);

fft100  = fft(x,  100);
fft1000 = fft(x, 1000);

figure;
stem([-500:10:490], abs(fftshift(fft100)));
title('DFT(100) of 24Hz');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-150 150])
