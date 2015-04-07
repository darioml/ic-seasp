clear all
close all

x = p1_singen(20, 1000, 100);
figure;
stem(x)

fft100  = fft(x,  100);
fft1000 = fft(x, 1000);

figure;
subplot(121);
stem([-500:10:490], abs(fftshift(fft100)));
title('DFT(100) of 20Hz');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-150 150])


subplot(122);
stem([-500:499], abs(fftshift(fft1000)));
title('DFT(1000) of 20Hz');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-150 150])