SEASP_Part_1_2_a
close all


%%

fftx = fft(x);

error = (real(fftx) - abs(fftx) ).^2;
fprintf('MSE between real and absolute of FFT: %0.12f\n', sum(error));

error = (ifft(real(fftx)) - x ).^2;
fprintf('MSE between ifft(real) of FFT: %0.12f\n', sum(error));

error = (ifft(abs(fftx)) - x ).^2;
fprintf('MSE between ifft(real) of FFT: %0.12f\n', sum(error));