clear all
close all

%%

threedb = zeros(100,1);
sidelobe = zeros(100,1);
for n=20:99
    x = bartlett(n);
    fftshifted = abs(fftshift(fft(x, fftsize)));

    max_val = fftshifted(1+fftsize/2);
    threedb(n) = length(fftshifted(fftshifted> (max_val/2) )) * (2*pi/fftsize);
    
    
    x = findpeaks(fftshifted);
    if (length(x) > 3)
        sidelobe(n)= 10*log10(x((length(x)-1)/2));
    end
end

% plot(20:100,threedb(20:end))
% title('Width of Main Lobe (Bartlett Window) vs Window Size')
% xlabel('Window Size (N)');
% ylabel('3dB Width ($\omega$)');
figure
plot(sidelobe)

%% Let's plot a few functions

fftsize = 10000;

b_sizes =[16 32 128 512];

figure;
clear max
for n=1:length(b_sizes)
    x = bartlett(b_sizes(n));
    fftsize= b_sizes(n)*2;
    fftshifted = abs( fftshift(   fft(x, fftsize)   ) );
    
    subplot(2, length(b_sizes), n);
    plot(linspace(-1,1,fftsize), fftshifted);
    title(sprintf('Barlett window, N=%i', b_sizes(n)));
    ylabel('$W_B(\omega)$')
    xlabel('Frequency ($\pi\omega$)')
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    cleanfigure;
    
    subplot(2, length(b_sizes), length(b_sizes) + n);
    plot(linspace(-1,1,fftsize), 10*log10( fftshifted+eps )   );
    title(sprintf('Barlett window, N=%i', b_sizes(n)));
    ylabel('$W_B(\omega)$ (dB)')
    xlabel('Frequency ($\pi\omega$)')
    xlim([-16/b_sizes(n) 16/(b_sizes(n))]);
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    cleanfigure;
   
end
