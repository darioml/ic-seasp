clear all
close all


%% Show me the chebwin window!

f_0 = 0.2;
x_n = @(a_1, a_2, phi_1, phi_2, sigma2, alpha, N) a_1*sin(f_0*2*pi*(0:(N-1)) + phi_1) + ...
    a_2*sin((f_0+(alpha/N))*2*pi*(0:(N-1)) + phi_2) + sqrt(sigma2)*randn([1 N]);


N = 256;

    figure;
    vals = [20 100 150];
    
    for a_2=1:length(vals)
        subplot(2,length(vals),a_2);
        signal = x_n(1, 0.1, 0, 0, 0, 8, N) .* chebwin(N, vals(a_2))';

        test = (1/N) * fft(signal);
        pdg = 10*log10(abs(test));
        plot( linspace(-1,1,length(pdg)), pdg  );
        title(sprintf('$\\hat{PGM}$ ($%idB$ Attenuation)', vals(a_2)));
        xlabel('Frequency ($\pi\omega$)')
        ylabel('Magnitude (dB)');
        xlim([0.4,0.7])

        set(gca,'TickDir','out');
        set(gca,'Box','off');
        set(gcf,'color','w');
        cleanfigure;
    end
    
    for a_2=1:length(vals)
        subplot(2,length(vals),length(vals)+a_2);
        signal = x_n(1, 0.0001, 0, 0, 0, 8, N) .* chebwin(N, vals(a_2))';

        test = (1/N) * fftshift(fft(signal));
        pdg = 10*log10(abs(test));
        plot( linspace(-1,1,length(pdg)), pdg  );
        title(sprintf('$\\hat{PGM}$ ($%idB$ Attenuation)', vals(a_2)));
        xlabel('Frequency ($\pi\omega$)')
        ylabel('Magnitude (dB)');
        xlim([0.3,0.6])

        set(gca,'TickDir','out');
        set(gca,'Box','off');
        set(gcf,'color','w');
        cleanfigure;
    end
    
    
    
    
%% Show me the blackman tuckey window!

f_0 = 0.2;
x_n = @(a_1, a_2, phi_1, phi_2, sigma2, alpha, N) a_1*sin(f_0*2*pi*(0:(N-1)) + phi_1) + ...
    a_2*sin((f_0+(alpha/N))*2*pi*(0:(N-1)) + phi_2) + sqrt(sigma2)*randn([1 N]);


N = 256;

    figure;
    vals = [20 100 150];
    
    for a_2=1:length(vals)
        subplot(2,length(vals),a_2);
        signal = x_n(1, 0.1, 0, 0, 0, 8, N) .* chebwin(N, vals(a_2))';

        signal = xcorr(signal, 'unbiased');
        test = (1/N) * fft(signal);
        pdg = 10*log10(abs(test));
        plot( linspace(-1,1,length(pdg)), pdg  );
        title(sprintf('$\\hat{PGM}$ ($%idB$ Attenuation)', vals(a_2)));
        xlabel('Frequency ($\pi\omega$)')
        ylabel('Magnitude (dB)');
        xlim([0.4,0.7])

        set(gca,'TickDir','out');
        set(gca,'Box','off');
        set(gcf,'color','w');
        cleanfigure;
    end
    
    for a_2=1:length(vals)
        subplot(2,length(vals),length(vals)+a_2);
        signal = x_n(1, 0.0001, 0, 0, 0, 8, N) .* chebwin(N, vals(a_2))';
        signal = xcorr(signal, 'unbiased');

        test = (1/N) * fftshift(fft(signal));
        pdg = 10*log10(abs(test));
        plot( linspace(-1,1,length(pdg)), pdg  );
        title(sprintf('$\\hat{PGM}$ ($%idB$ Attenuation)', vals(a_2)));
        xlabel('Frequency ($\pi\omega$)')
        ylabel('Magnitude (dB)');
        xlim([0.3,0.6])

        set(gca,'TickDir','out');
        set(gca,'Box','off');
        set(gcf,'color','w');
        cleanfigure;
    end


%% let's filter
f_0 = 0.2;
x_n = @(a_1, a_2, phi_1, phi_2, sigma2, alpha, N) a_1*sin(f_0*2*pi*(0:(N-1)) + phi_1) + ...
    a_2*sin((f_0+(alpha/N))*2*pi*(0:(N-1)) + phi_2) + sqrt(sigma2)*randn([1 N]);


N = 256;
cheb_size = 50;
for alpha=[4 12]
    figure;
    vals = [.01 .001 .0001 .000001];
    for a_2=1:length(vals)
        subplot(1,length(vals),a_2);
        signal = x_n(1, vals(a_2), 0, 0, 0, alpha, N) .* chebwin(N, cheb_size)';

        test = (1/N) * fftshift(fft(signal));
        pdg = 10*log10(abs(test));
        plot( linspace(-1,1,length(pdg)), pdg  );
        title(sprintf('Periodogram ($a_2$ = %0.6f)', vals(a_2)));
        xlabel('Frequency ($\pi\omega$)')
        ylabel('Magnitude (dB)');
        xlim([0.3,0.6])

        set(gca,'TickDir','out');
        set(gca,'Box','off');
        set(gcf,'color','w');
        cleanfigure;
    end
    cheb_size = 200;
end




%% let's filter
f_0 = 0.2;
x_n = @(a_1, a_2, phi_1, phi_2, sigma2, alpha, N) a_1*sin(f_0*2*pi*(0:(N-1)) + phi_1) + ...
    a_2*sin((f_0+(alpha/N))*2*pi*(0:(N-1)) + phi_2) + sqrt(sigma2)*randn([1 N]);


N = 256;
cheb_size = 50;
for alpha=[4 12]
    figure;
    vals = [.01 .001 .0001 .000001];
    for a_2=1:length(vals)
        subplot(1,length(vals),a_2);
        signal = x_n(1, vals(a_2), 0, 0, 0, alpha, N) .* chebwin(N, cheb_size)';
        
        signal = xcorr(signal, 'unbiased');
        
        test = (1/N) * fftshift(fft(signal));
        pdg = 10*log10(abs(test));
        plot( linspace(-1,1,length(pdg)), pdg  );
        title(sprintf('Periodogram ($a_2$ = %0.6f)', vals(a_2)));
        xlabel('Frequency ($\pi\omega$)')
        ylabel('Magnitude (dB)');
        xlim([0.3,0.6])

        set(gca,'TickDir','out');
        set(gca,'Box','off');
        set(gcf,'color','w');
        cleanfigure;
    end
    cheb_size = 200;
end


