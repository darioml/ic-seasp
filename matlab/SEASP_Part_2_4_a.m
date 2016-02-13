clear all
close all

%% get data

load('ecg_data/02_dario/RAW.mat');

SMPL_SIZE = 240000;

exp1 = data(39950:39950+SMPL_SIZE-1);
exp2 = data(304400:304400+SMPL_SIZE-1);
exp3 = data(579300:579300+SMPL_SIZE-1);


ECG_Dario = [exp1, exp2, exp3];

save('ecg_data_dario.mat', 'ECG_Dario', 'fs');
clear all
close all

%% plot data
load('ecg_data_dario.mat');
figure;
plot(ECG_Dario(:))


figure;
subplot(3,1,1)
    plot(ECG_Dario(:,1));
subplot(3,1,2)
    plot(ECG_Dario(:,2));
subplot(3,1,3)
    plot(ECG_Dario(:,3));
    
%% let's do RRI

[RRI_trial_1,fs_RRI_1] = ECG_to_RRI(ECG_Dario(:, 1),fs); 
[RRI_trial_2,fs_RRI_2] = ECG_to_RRI(ECG_Dario(:, 2),fs); 
[RRI_trial_3,fs_RRI_3] = ECG_to_RRI(ECG_Dario(:, 3),fs); 


save('RRI_Trials_Dario.mat', 'RRI_trial_1', 'RRI_trial_2', 'RRI_trial_3', 'fs_RRI_2');
%% psd stuff

load('RRI_Trials_Dario.mat')
SIGNAL = RRI_trial_3;



figure
FREQ_LIMS = [0 200]
NO_BINS_PER_HZ = 5;
fft_dm1911 = @(x) abs(fftshift(fft(x, fs*NO_BINS_PER_HZ))).^2;
w = linspace(-fs/2,fs/2,(fs*NO_BINS_PER_HZ)+1);
w = w(1:(end-1));

nomean = SIGNAL - mean(SIGNAL);


subplot(221);
    plot(w, mag2db(fft_dm1911(nomean)));
    title('Zero Mean Signal');
    axis tight;
    xlim(FREQ_LIMS);
    ylabel('Mag of PSD')
    xlabel('Frequency (Hz)')
    

timewindows = [30 60 120];
for i=1:length(timewindows)
    wdw = timewindows(i);
    smpl_size = fs_RRI_2*wdw;
    no_samples = length(SIGNAL)/smpl_size;
    
    results = zeros(no_samples, fs*NO_BINS_PER_HZ);
    for j=1:no_samples
        data = SIGNAL( ((j-1)*smpl_size+1) : (j*smpl_size) );
        results(j,:) = fft_dm1911(data);
    end
    

    subplot(2,2,i+1);
        plot(w, mag2db( mean(results) ));
        xlim(FREQ_LIMS);
        title(sprintf('Averaged (time=%i s)',timewindows(i) ));
        ylabel('Mag of PSD');
        xlabel('Frequency (Hz)');
end


%% AR stuff

orders = [2 4 14 30 50 100];
for i=1:length(orders)
    localOrder = orders(i);
    
    pxx = pyulear(RRI_trial_3, localOrder);
    
    subplot(1,length(orders),i);
    plot( linspace(0,1,length(pxx)), pxx)
    title(sprintf('Spectrum Estimate (AR(%i))', localOrder));
    xlabel('Frequency ($\pi$ rads)')
    ylabel('Amplitude')
    xlim([0 0.1])
end

