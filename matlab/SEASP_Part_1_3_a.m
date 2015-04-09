clear all
close all

%%

values = 2.^[4 5 6 7 8 9 10 11];
threedb = zeros(length(values),1);
sidelobe = zeros(length(values),1);
for val=1:length(values)
    n = values(val);
    
    x = bartlett(n);
    fftx = fftshift(fft(x));
    max_val = max(fftx);
    
    threedb(val) = length(fftx(fftx> (max_val/2) )) * (2*pi/(length(fftx)-1) );
        
    search = 20*log10(  abs(fftx( ((1 + length(fftx)/2)):end )) +eps   );
    x = findpeaks(search);
    sidelobe(val)= x(1) - search(1);
end

figure
subplot(121)
    plot(values,threedb)
    title('Width of Main Lobe (Bartlett Window) vs Window Size');
    xlim([0 max(values)/4]);
    xlabel('Window Size (N)');
    ylabel('3dB Width ($\omega$)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    cleanfigure;
subplot(122)
    plot(values, sidelobe)
    title('Sidelobe height (Bartlett Window)');
    xlabel('Window Size (N)');
    ylabel('Sidelobe Height (dB)');
    xlim([0 max(values)]);
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    cleanfigure;


%% Another section

fftsize = 10000;

b_sizes =[16 32 128 512];

figure;
clear max
for n=1:length(b_sizes)
    x = bartlett(b_sizes(n));
    fftsize= b_sizes(n)*2;
    fftx = abs( fftshift(   fft(x, fftsize)   ) );
    
    subplot(2, length(b_sizes), n);
    plot(linspace(-1,1,fftsize), fftx);
    title(sprintf('Barlett window, N=%i', b_sizes(n)));
    ylabel('$W_B(\omega)$')
    xlabel('Frequency ($\pi\omega$)')
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    cleanfigure;
    
    subplot(2, length(b_sizes), length(b_sizes) + n);
    plot(linspace(-1,1,fftsize), 20*log10( fftx+eps )   );
    title(sprintf('Barlett window, N=%i', b_sizes(n)));
    ylabel('$W_B(\omega)$ (dB)')
    xlabel('Frequency ($\pi\omega$)')
    xlim([-16/b_sizes(n) 16/(b_sizes(n))]);
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    cleanfigure;
   
end
