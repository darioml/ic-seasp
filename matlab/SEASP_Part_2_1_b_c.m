clear all
close all



N = 40;
f_s=300;
iters = 20;

realisations = zeros((N*2)-1, iters);

for i=1:iters,
    sinu = sin(2*pi*50/f_s*(0:(N-1)))' + sin(2*pi*30/f_s*(0:(N-1)))' + sqrt(0.25)*randn([N 1]);
    realisations(:,i) = fftshift(fft(fftshift(xcorr(sinu,'biased'))));
end

w = linspace(-1,1,(N*2)-1);
figure
subplot(1,2,1);
    plot(w, real(realisations), 'c');
    hold all;
    plot(w, mean(real(realisations)'),'LineWidth',2);
    title('PSD estimates and mean')
    xlabel('Frequency ($\pi$ rads)')
    ylabel('Power/Radian')
    xlim([0 1])
subplot(1,2,2);
    plot(w, 10*log10(real(realisations)), 'c');
    hold all;
    plot(w, mean(10*log10(real(realisations))'),'LineWidth',2);
    title('PSD estimates and mean (dB)')
    ylabel('Power/Radian (dB)')
    ylabel('dB')
    xlim([0 1])
    
figure
subplot(1,2,1);
    plot(w, var(real(realisations)').^2,'LineWidth',2);
    title('Std Dev of PSD estimate')
    xlabel('Frequency ($\pi$ rads)')
    ylabel('Std Dev')
    xlim([0 1])
subplot(1,2,2);
    plot(w, var(10*log10(real(realisations))').^2,'LineWidth',2);
    title('Std Dev of Log PSD estimate')
    xlabel('Frequency ($\pi$ rads)')
    ylabel('Std Dev')
    xlim([0 1])
    ylim([0 10000])