close all
clear all

%% let's get the signal from part 4_2_a

SEASP_Part_4_2_a
close all

%% let's do some magic!

[ weights, error, pred_out ] = p4_clms_ar( y, 1, 0.01 );
H = zeros(1024,LENGTH);

for i=1:LENGTH
    [h,w] = freqz(1, [1; -conj(weights(i))], 1024);
    H(:, i) = abs(h).^2;
end

medianH = 50*median(median(H));
H(H>medianH) = medianH;

figure
    surf(1:LENGTH, (1:1024)/1024, H, 'LineStyle','none');
    view(2);
    ylabel('Noramlised Frequency ($\pi rads$)')
    xlabel('Sample Number (N)')
    title('LMS Spectrogram')
    axis tight


figure
    plot(real(weights)); hold all; plot(imag(weights)); 
    title('LMS Weights')
    xlabel('Sample Number (N)')
    ylabel('Weight')
    legend('$\Re(w)$', '$\Im(w)$');
    
    
    
    
%% let's do some more magic!

[ weights, error, pred_out ] = p4_clms_ar( y, 1, 0.001 );
H = zeros(1024,LENGTH);

for i=1:LENGTH
    [h,w] = freqz(1, [1; -conj(weights(i))], 1024);
    H(:, i) = abs(h).^2;
end

medianH = 50*median(median(H));
H(H>medianH) = medianH;

subplot(131)
    surf(1:LENGTH, (1:1024)/1024, H, 'LineStyle','none');
    view(2);
    ylim([0 0.4])
    ylabel('N. Freq ($\pi rads$)')
    xlabel('Sample Number (N)')
    title(sprintf('LMS Spectrogram ($\\mu = %0.3f$)', 0.001))
    axis tight
    ylim([0 0.4])

    
    
    
    
    
[ weights, error, pred_out ] = p4_clms_ar( y, 1, 0.07 );
H = zeros(1024,LENGTH);

for i=1:LENGTH
    [h,w] = freqz(1, [1; -conj(weights(i))], 1024);
    H(:, i) = abs(h).^2;
end

medianH = 50*median(median(H));
H(H>medianH) = medianH;
    

subplot(132)
    surf(1:LENGTH, (1:1024)/1024, H, 'LineStyle','none');
    view(2);
    ylim([0 0.4])
    ylabel('N. Freq ($\pi rads$)')
    xlabel('Sample Number (N)')
    title(sprintf('LMS Spectrogram ($\\mu = %0.3f$)', 0.07))
    axis tight
    ylim([0 0.4])

    
    
    
    
    
    
        
[ weights, error, pred_out ] = p4_clms_ar( y, 1, 0.8 );
H = zeros(1024,LENGTH);

for i=1:LENGTH
    [h,w] = freqz(1, [1; -conj(weights(i))], 1024);
    H(:, i) = abs(h).^2;
end

medianH = 50*median(median(H));
H(H>medianH) = medianH;
    

subplot(133)
    surf(1:LENGTH, (1:1024)/1024, H, 'LineStyle','none');
    view(2);
    ylabel('N. Freq ($\pi rads$)')
    xlabel('Sample Number (N)')
    title(sprintf('LMS Spectrogram ($\\mu = %0.3f$)', 0.8))
    axis tight
    ylim([0 0.4])

    