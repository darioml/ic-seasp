
clear all
close all

%% Specrogram testing
tmp = load('EEG_Data/EEG_Data_Assignment2.mat');
t= -2:0.001:2;
x = tmp.POz;
N = length(t);

windowN= 128;
overlap= 100;
sampling=1000;



figure;
    subplot(1, 4, 1);
    window = hamming(windowN);
    spectrogram(x, window, overlap, windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title('Hamming Window')
    subplot(1, 4, 2);
    window = hanning(windowN);
    spectrogram(x, window, overlap, windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title('Hanning Window')
    subplot(1, 4, 3);
    window = rectwin(windowN);
    spectrogram(x, window, overlap, windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title('Rectangular Window')
    subplot(1, 4, 4);
    window = chebwin(windowN);
    spectrogram(x, window, overlap, windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title('Chebyshev Window (100dB)')
    
    
    
figure;
    subplot(1, 4, 1);
    windowN= 64;  
    window = hanning(windowN);
    spectrogram(x, window, round(0.8*windowN), windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Window size = %i',windowN));
    subplot(1, 4, 2);
    windowN= 128;  
    window = hanning(windowN);
    spectrogram(x, window, round(0.8*windowN), windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Window size = %i',windowN));
    subplot(1, 4, 3);
    windowN= 256;  
    window = hanning(windowN);
    spectrogram(x, window, round(0.8*windowN), windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Window size = %i',windowN));
    subplot(1, 4, 4);
    windowN= 512;  
    window = hanning(windowN);
    spectrogram(x, window, round(0.8*windowN), windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Window size = %i',windowN));
    
    
    
windowN= 256;  
figure;
    subplot(1, 4, 1);
    window = hanning(windowN);
    spectrogram(x, window, 0, windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Overlap = %i',0));
    subplot(1, 4, 2);
    spectrogram(x, window, 90, windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Overlap = %i',90));
    subplot(1, 4, 3);
    window = hanning(windowN);
    spectrogram(x, window, 180, windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Overlap = %i',180));
    subplot(1, 4, 4);
    window = hanning(windowN);
    spectrogram(x, window, 255, windowN, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Overlap = %i',255));
    
    
    
windowN= 256;  
figure;
    subplot(1, 4, 1);
    window = hanning(windowN);
    spectrogram(x, window, 200, 32, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('FFT length = %i',32));
    subplot(1, 4, 2);
    spectrogram(x, window, 200, 64, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('FFT length = %i',64));
    subplot(1, 4, 3);
    window = hanning(windowN);
    spectrogram(x, window, 200, 128, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('FFT length = %i',128));
    subplot(1, 4, 4);
    window = hanning(windowN);
    spectrogram(x, window, 200, 256, 'yaxis');
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('FFT length = %i',256));
    
    
    
    
%% Let'ss actually work now

figure
subplot(1,3,1);

    windowN= 2046;  
    window = hanning(windowN);

    spectrogram(x, window, round(0.3*windowN), windowN, tmp.fs, 'yaxis');
    ylim([0 60])
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Spectrogram (nfft = %i)', windowN))
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(1,3,2);

    windowN= 4096;  
    window = hanning(windowN);

    spectrogram(x, window, round(0.3*windowN), windowN, tmp.fs, 'yaxis');
    ylim([0 60])
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Spectrogram (nfft = %i)', windowN))
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(1,3,3);

    windowN= 4096;  
    window = hanning(windowN);

    spectrogram(x, window, round(0.8*windowN), windowN, tmp.fs, 'yaxis');
    ylim([5 16])
    ylabel('Norm Freq. ($\times\pi rad/sample$)')
    title(sprintf('Zoom on Spectrogram (nfft = %i)', windowN))
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');