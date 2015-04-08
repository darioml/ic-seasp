clear all
close all


%%
f_0 = 0.2;
x_n = @(a_1, a_2, phi_1, phi_2, sigma2, alpha, N) a_1*sin(f_0*2*pi*(0:(N-1)) + phi_1) + ...
    a_2*sin((f_0+(alpha/N))*2*pi*(0:(N-1)) + phi_2) + sqrt(sigma2)*randn([1 N]);


N = 256;
figure;
vals = [1 3 4 7];
for alpha=1:length(vals)
    subplot(1,4,alpha);
    signal = x_n(1, 1, 0, 0, 0, vals(alpha), N) .* hamming(N)';
    
    test = (1/N) * fft(signal);
    pdg = 10*log10(abs(test));
    plot( linspace(-1,1,length(pdg)), pdg  );
    title(sprintf('Periodogram ($\\alpha = %i$)', vals(alpha)));
    xlabel('Frequency ($\pi\omega$)')
    ylabel('Magnitude (dB)');
    xlim([0,1])
    
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    cleanfigure;
end