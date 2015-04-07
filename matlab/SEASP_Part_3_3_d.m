clear all
close all

%% Spectrogram

load EEG_Data/EEG_Data_Assignment2.mat

N=length(POz);
freq = 50;

genNoise = 2*sin(2*pi*(freq/fs)*(0:N-1)) + sqrt(0.25)*randn([1 N]);
% plot(genNoise); xlim([0 200]);
% Spectrum of noise : 
% plot(fs*(0:N-1)/N,abs(fft(genNoise)))


[~,output,~] = anc_lms( POz, genNoise, 0.001, 9);





FFTLENGTH = 1024;
WINDOWLENGTH = 1024;

window =  hanning(WINDOWLENGTH);
subplot(1,2,1)
spectrogram(output, window, round(0.5*WINDOWLENGTH), FFTLENGTH, fs, 'yaxis')
axis([0 N/fs-1 0 150])
title('POz (Noise Removed)')
xlabel('Time(s)')
subplot(1,2,2)
spectrogram(POz, window, round(0.5*WINDOWLENGTH), FFTLENGTH, fs, 'yaxis')
axis([0 N/fs-1 0 150])
title('POz (Original Signal)')
xlabel('Time(s)')

figure
spectrogram(POz-output', window, round(0.1*WINDOWLENGTH), FFTLENGTH, fs, 'yaxis')
axis([0 N/fs-1 0 150])
title('POz (Original Signal - Noise Removed)')
xlabel('Time(s)')


