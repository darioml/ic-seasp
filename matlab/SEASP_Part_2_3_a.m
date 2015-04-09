
clear all
close all

%% Specrogram testing

t= -2:0.001:2;
x = chirp(t,100,1,200,'quadratic');
N = length(t);

sampling=1000;



    
windowN= 256;  
figure;
    subplot(1, 4, 1);
    window = hanning(windowN);
    spectrogram(x, window, 200, 256, 200, 'yaxis');
    title(sprintf('FS = %i',200));
    subplot(1, 4, 2);
    spectrogram(x, window, 200, 256, 400, 'yaxis');
    title(sprintf('FS = %i',400));
    subplot(1, 4, 3);
    window = hanning(windowN);
    spectrogram(x, window, 200, 256, 800, 'yaxis');
    title(sprintf('FS = %i',800));
    subplot(1, 4, 4);
    window = hanning(windowN);
    spectrogram(x, window, 200, 256, 1000, 'yaxis');
    title(sprintf('FS = %i',1000));
    
        set(gcf,'color','w');

    axesHandles = get(gcf,'children');
    axesHandles = findall(0,'type','axes');
    set(axesHandles,'TickDir','out');
    set(axesHandles,'Box','off');
    cleanfigure;
    

windowN= 128;
    
overlap= 100;
figure;
    subplot(1, 4, 1);
    window = hamming(windowN);
    spectrogram(x, window, overlap, windowN, 1000, 'yaxis');
    title('Hamming Window')
    subplot(1, 4, 2);
    window = hanning(windowN);
    spectrogram(x, window, overlap, windowN, 1000, 'yaxis');
    title('Hanning Window')
    subplot(1, 4, 3);
    window = rectwin(windowN);
    spectrogram(x, window, overlap, windowN, 1000, 'yaxis');
    title('Rectangular Window')
    subplot(1, 4, 4);
    window = chebwin(windowN);
    spectrogram(x, window, overlap, windowN, 1000, 'yaxis');
    title('Chebyshev Window (100dB)')
        set(gcf,'color','w');

    axesHandles = get(gcf,'children');
    axesHandles = findall(0,'type','axes');
    set(axesHandles,'TickDir','out');
    set(axesHandles,'Box','off');
    cleanfigure;
    
figure;
    subplot(1, 4, 1);
    windowN= 64;  
    window = hanning(windowN);
    spectrogram(x, window, round(0.8*windowN), windowN, 1000, 'yaxis');
    title(sprintf('Window size = %i',windowN));
    subplot(1, 4, 2);
    windowN= 128;  
    window = hanning(windowN);
    spectrogram(x, window, round(0.8*windowN), windowN, 1000, 'yaxis');
    title(sprintf('Window size = %i',windowN));
    subplot(1, 4, 3);
    windowN= 256;  
    window = hanning(windowN);
    spectrogram(x, window, round(0.8*windowN), windowN, 1000, 'yaxis');
    title(sprintf('Window size = %i',windowN));
    subplot(1, 4, 4);
    windowN= 512;  
    window = hanning(windowN);
    spectrogram(x, window, round(0.8*windowN), windowN, 1000, 'yaxis');
    title(sprintf('Window size = %i',windowN));
       set(gcf,'color','w');

    axesHandles = get(gcf,'children');
    axesHandles = findall(0,'type','axes');
    set(axesHandles,'TickDir','out');
    set(axesHandles,'Box','off');
    cleanfigure;
    
    
windowN= 256;  
figure;
    subplot(1, 4, 1);
    window = hanning(windowN);
    spectrogram(x, window, 0, windowN, 1000, 'yaxis');
    title(sprintf('Overlap = %i',0));
    subplot(1, 4, 2);
    spectrogram(x, window, 90, windowN, 1000, 'yaxis');
    title(sprintf('Overlap = %i',90));
    subplot(1, 4, 3);
    window = hanning(windowN);
    spectrogram(x, window, 180, windowN, 1000, 'yaxis');
    title(sprintf('Overlap = %i',180));
    subplot(1, 4, 4);
    window = hanning(windowN);
    spectrogram(x, window, 255, windowN, 1000, 'yaxis');
    title(sprintf('Overlap = %i',255));
        set(gcf,'color','w');

    axesHandles = get(gcf,'children');
    axesHandles = findall(0,'type','axes');
    set(axesHandles,'TickDir','out');
    set(axesHandles,'Box','off');
    cleanfigure;
    
