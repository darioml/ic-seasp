clear all
close all


%%
f_0 = 0.2;
x_n = @(a_1, a_2, phi_1, phi_2, sigma2, alpha, N) a_1*sin(f_0*2*pi*(0:(N-1)) + phi_1) + ...
    a_2*sin((f_0+(alpha/N))*2*pi*(0:(N-1)) + phi_2) + sqrt(sigma2)*randn([1 N]);


N = 256;

for alpha=[4 12]
    figure;
    vals = [1 .2 .02 .001];
    for a_2=1:length(vals)
        subplot(1,length(vals),a_2);
        signal = x_n(1, vals(a_2), 0, 0, 0, alpha, N) .* rectwin(N)';

        test = (1/N) * fft(signal);
        pdg = 10*log10(abs(test));
        plot( linspace(-1,1,length(pdg)), pdg  );
        title(sprintf('Periodogram ($a_2$ = %0.3f)', vals(a_2)));
        xlabel('Frequency ($\pi\omega$)')
        ylabel('Magnitude (dB)');
        xlim([0.4,0.7])

        set(gca,'TickDir','out');
        set(gca,'Box','off');
        set(gcf,'color','w');
        cleanfigure;
    end
end



%%


N=256;
MULTIP = 5;

window = bartlett(N);
fftwin = abs(fftshift(fft(window, MULTIP*N)));

w = linspace(-1,1,MULTIP*N+1);
w = w(1:end-1);

plot(w,20*log10(fftwin + eps))
xlim([0 0.5])
xlabel('Norm Freq. ($\pi rads$)')
ylabel('$|FFT|$ (dB)');

x1=40/N;
x2=120/N;
hold on
plot([x1 x1],[100 -400],'Color','c','LineWidth',2)
plot([x2 x2],[100 -400],'Color','b','LineWidth',2)

legend('Bartlett', '4/N','12/N')