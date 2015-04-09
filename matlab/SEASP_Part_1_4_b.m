clear all
close all

load EEG_Data/EEG_Data_Assignment1.mat

SAMP_RATE = 5;
FREQ_LIMS = [0 60];

%%
figure
fft_dm1911 = @(x) abs(fftshift(fft(x, fs*5))).^2;
w = linspace(-fs/2,fs/2,(fs*5)+1);
w = w(1:(end-1));
nomean = POz - mean(POz);


subplot(221);
    plot(w, mag2db(fft_dm1911(nomean)));
    title('Zero Mean Signal');
    axis tight;
    xlim(FREQ_LIMS);
    ylabel('Mag of PSD')
    xlabel('Frequency (Hz)')
    

timewindows = [1 5 10];
for i=1:length(timewindows)
    wdw = timewindows(i);
    smpl_size = fs*wdw;
    no_samples = length(POz)/smpl_size;
    
    results = zeros(no_samples, 6000);
    for j=1:no_samples
        data = POz( ((j-1)*smpl_size+1) : (j*smpl_size) );
        results(j,:) = fft_dm1911(data);
    end
    

    subplot(2,2,i+1);
        plot(w, mag2db( mean(results) ));
        xlim(FREQ_LIMS);
        title(sprintf('Averaged (time=%i s)',timewindows(i) ));
        ylabel('Mag of PSD');
        xlabel('Frequency (Hz)');
end


    %%
    
subplot(142);
    
    
subplot(144);
    plot(w, mag2db(fft_dm1911(db_no_mean)));
    xlim([0 1]); ylim([0 40]);
    title('Logged (no mean) Signal');
    ylabel('Mag of PSD')
    xlabel('Norm Frequency ($\pi rads/sec$)')