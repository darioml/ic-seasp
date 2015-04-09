clear all
close all

%%
N=128;


% tmp = x .* rectwin(N)';
noSamples = [30 40 50];
for i=1:length(noSamples)
    n=1:noSamples(i);
    noise = 0.2/sqrt(2) * ([1 1j] * randn([2 length(n)]));
    x = exp(1j*2*pi*0.3*n)+exp(1j*2*pi*0.32*n) + noise;
    subplot(1,length(noSamples),i);
    fftans = fft(x,N);
    plot(10*log10(abs(fftans)))
        title('PGM-PSD Estimate')
        xlabel('Frequency')
        ylabel('Power/freq (dB/Hz)');
        xlim([0 128])
end