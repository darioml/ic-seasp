clear all
close all

%%

N = 50;
f_s=250;

wgn = randn([N 1]);
sinu = sin(2*pi*30/f_s*(0:(N-1)))' + sqrt(0.25)*randn([N 1]);
fwgn= filter(1, [1 0.2 -0.6], randn([N 1]) );


wgnCorrB = fft(fliplr(fftshift(xcorr(wgn,wgn,'biased'))));
wgnCorrU = fft(fliplr(fftshift(xcorr(wgn,wgn,'unbiased'))));
sinCorrB = fft(fliplr(fftshift(xcorr(sinu,'biased'))));
sinCorrU = fft(fliplr(fftshift(xcorr(sinu,'unbiased'))));
fwgnCorrB= fft(fliplr(fftshift(xcorr(fwgn,fwgn,'biased'))));
fwgnCorrU= fft(fliplr(fftshift(xcorr(fwgn,fwgn,'unbiased'))));


figure;
subplot(3,3,1);
    plot(wgn);
    title('White Gaussian Noise');
    xlabel('Sample (N)');
    ylabel('x(n)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,2);
    plot(sinu);
    title('Sinusoid with WGN');
    xlabel('Sample (N)');
    ylabel('x(n)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,3);
    plot(fwgn);
    title('AR(2) Proccess from WGN');
    xlabel('Sample (N)');
    ylabel('x(n)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,4);
    plot(wgnCorrB);
    title('Biased $r(k)$')
    xlabel('Time Delay (k)');
    ylabel('r(k)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,5);
    plot(sinCorrB);
    title('Biased $r(k)$')
    xlabel('Time Delay (k)');
    ylabel('r(k)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,6);
    plot(fwgnCorrB);
    title('Biased $r(k)$')
    xlabel('Time Delay (k)');
    ylabel('r(k)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,7);
    plot(wgnCorrU);
    title('Unbiased $r(k)$')
    xlabel('Time Delay (k)');
    ylabel('r(k)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,8);
    plot(sinCorrU);
    title('Unbiased $r(k)$')
    xlabel('Time Delay (k)');
    ylabel('r(k)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,9);
    plot(fwgnCorrU);
    title('Unbiased $r(k)$')
    xlabel('Time Delay (k)');
    ylabel('r(k)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    
    
   
%% Biased and unbiased for SIN+WGN
N = 50;
f_s=250;

sinu = sin(2*pi*30/f_s*(0:(N-1)))' + sqrt(0.25)*randn([N 1]);



wgnCorrB = xcorr(wgn,wgn,'biased');
wgnCorrU = xcorr(wgn,wgn,'unbiased');
sinCorrB = xcorr(sinu,sinu,'biased');
sinCorrU = xcorr(sinu,sinu,'unbiased');
fwgnCorrB= xcorr(fwgn,fwgn,'biased');
fwgnCorrU= xcorr(fwgn,fwgn,'unbiased');

figure;
subplot(1,3,1);
    plot(sinu);
    title('Sinusoid with WGN');
    xlabel('Sample (N)');
    ylabel('x(n)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(1,3,2);
    plot(sinCorrB);
    title('Biased $r(k)$')
    xlabel('Time Delay (k)');
    ylabel('r(k)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(1,3,3);
    plot(sinCorrU);
    title('Unbiased $r(k)$')
    xlabel('Time Delay (k)');
    ylabel('r(k)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');


%% Show PSD here
N = 50;
f_s=250;

wgn = randn([N 1]);
sinu = sin(2*pi*30/f_s*(0:(N-1)))' + sqrt(0.25)*randn([N 1]);
fwgn= filter(1, [1 0.2 -0.6], randn([N 1]) );


wgnCorrB = fft(fliplr(fftshift(xcorr(wgn,wgn,'biased'))));
wgnCorrU = fft(fliplr(fftshift(xcorr(wgn,wgn,'unbiased'))));
sinCorrB = fft(fliplr(fftshift(xcorr(sinu,'biased'))));
sinCorrU = fft(fliplr(fftshift(xcorr(sinu,'unbiased'))));
fwgnCorrB= fft(fliplr(fftshift(xcorr(fwgn,fwgn,'biased'))));
fwgnCorrU= fft(fliplr(fftshift(xcorr(fwgn,fwgn,'unbiased'))));

figure;
subplot(3,3,1);
    plot(wgn);
    title('White Gaussian Noise');
    xlabel('Sample (N)');
    ylabel('x(n)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,2);
    plot(sinu);
    title('Sinusoid with WGN');
    xlabel('Sample (N)');
    ylabel('x(n)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,3);
    plot(fwgn);
    title('AR(2) Proccess from WGN');
    xlabel('Sample (N)');
    ylabel('x(n)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    
subplot(3,3,4);
    plot(linspace(-1,1,99),real(wgnCorrB));
    title('Biased $P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    ylabel('P($\omega$)');
    xlim([0 1])
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,5);
    plot(linspace(-1,1,99),real(sinCorrB));
    title('Biased $P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    xlim([0 1])
    ylabel('P($\omega$)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,6);
    plot(linspace(-1,1,99),real(fwgnCorrB));
    title('Biased $P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    xlim([0 1])
    ylabel('P($\omega$)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    
subplot(3,3,7);
    plot(linspace(-1,1,99),real(wgnCorrU));
    title('Unbiased $P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    xlim([0 1])
    ylabel('P($\omega$)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,8);
    plot(linspace(-1,1,99),real(sinCorrU));
    title('Unbiased $P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    xlim([0 1])
    ylabel('P($\omega$)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
subplot(3,3,9);
    plot(linspace(-1,1,99),real(fwgnCorrU));
    title('Unbiased $P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    xlim([0 1])
    ylabel('P($\omega$)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    
    
%% plot together



figure;
subplot(2,3,1);
    plot(wgn);
    title('White Gaussian Noise');
    xlabel('Sample (N)');
    ylabel('x(n)');
subplot(2,3,2);
    plot(sinu);
    title('Sinusoid with WGN');
    xlabel('Sample (N)');
    ylabel('x(n)');
subplot(2,3,3);
    plot(fwgn);
    title('AR(2) Proccess from WGN');
    xlabel('Sample (N)');
    ylabel('x(n)');
    
subplot(2,3,4);
    hold all
    plot(linspace(-1,1,99),real(wgnCorrB));
    plot(linspace(-1,1,99),real(wgnCorrU));
    title('$P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    ylabel('P($\omega$)');
    xlim([0 1])
    legend('Biased', 'Unbiased')
subplot(2,3,5);
    hold all
    plot(linspace(-1,1,99),real(sinCorrB));
    plot(linspace(-1,1,99),real(sinCorrU));
    title('$P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    ylabel('P($\omega$)');
    xlim([0 1])
    legend('Biased', 'Unbiased')
subplot(2,3,6);
    hold all
    plot(linspace(-1,1,99),real(fwgnCorrB));
    plot(linspace(-1,1,99),real(fwgnCorrU));
    title('$P(k)$')
    xlabel('Frequency ($\pi\omega$)');
    ylabel('P($\omega$)');
    xlim([0 1])
    legend('Biased', 'Unbiased')
    