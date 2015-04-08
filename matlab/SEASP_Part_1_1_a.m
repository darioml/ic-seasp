clear all
close all

%%
x = p1_singen(40, 100, 200);
figure;
subplot(1,2,1);
    stem(x)
    
    
subplot(1,2,2);
stem(abs(fftshift(fft(x))))
    
%%

figure;
    subplot(121);
    stem([-500:10:490], abs(fftshift(fft100)));
    title('DFT(100) of 20Hz');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    xlim([-150 150])

    subplot(122);
    stem([-500:499], abs(fftshift(fft1000)));
    title('DFT(1000) of 20Hz');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    xlim([-150 150])