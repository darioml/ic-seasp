clear all
close all

%%
N=800;
n=0:60;

noise = 0.2/sqrt(2) * ([1 1j] * randn([2 length(n)]));
x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n) + noise;

% tmp = x .* rectwin(N)';
fftans = fft(x,N);

subplot(1,2,2);
plot(10*log10(abs(fftans)))
    title('Periodogram PSD Estimate')
    xlabel('Frequency')
    ylabel('Power/frequency (dB/Hz)');