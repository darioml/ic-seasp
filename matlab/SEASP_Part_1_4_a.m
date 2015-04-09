clear all
close all

%% let's do this!
load sunspot.dat

x = sunspot(:,1);
data = sunspot(:,2);

no_mean = data - mean(data);
no_trend= detrend(data);
db_no_mean = log10(data+eps) - (mean(log10(data+eps)));

fft_dm1911 = @(x) abs(fftshift(fft(x)));
w = linspace(-1,1,length(data)+1);
w = w(1:(end-1));

figure
subplot(141);
    plot(w, mag2db(fft_dm1911(data)));
    xlim([0 1]); ylim([0 80]);
    title('Original Signal');
    ylabel('Mag of PSD')
    xlabel('Norm Frequency ($\pi rads/sec$)')
    
subplot(142);
    plot(w, mag2db(fft_dm1911(no_mean)));
    xlim([0 1]); ylim([0 80]);
    title('Zero Mean Signal');
    ylabel('Mag of PSD')
    xlabel('Norm Frequency ($\pi rads/sec$)')
    
subplot(143);
    plot(w, mag2db(fft_dm1911(no_trend)));
    xlim([0 1]); ylim([0 80]);
    title('De-trended Signal');
    ylabel('Mag of PSD')
    xlabel('Norm Frequency ($\pi rads/sec$)')
    
subplot(144);
    plot(w, mag2db(fft_dm1911(db_no_mean)));
    xlim([0 1]); ylim([0 40]);
    title('Logged (no mean) Signal');
    ylabel('Mag of PSD')
    xlabel('Norm Frequency ($\pi rads/sec$)')
    
