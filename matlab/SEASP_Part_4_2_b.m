close all
clear all

%% let's get the signal from part 4_2_a

SEASP_Part_4_2_a

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