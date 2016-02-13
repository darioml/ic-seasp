clear all
close all

%% CLOSE

LENGTH = 1500;
fs = 5000;

noise= sqrt(0.05)*sqrt(0.5)*[1 1j]*randn(2,LENGTH); %thank you http://www.mathworks.com/matlabcentral/newsreader/view_thread/32077

phase(1:500)    = 100;
phase(501:1000) = 100 + (  (1:500) ./ 2 );
phase(1001:1500)= 100 + (( (1:500) ./ 25).^2);

phase = cumsum(phase);


y = exp(1j*( (2*pi/fs ) .* phase)) + noise;


figure
subplot(1,2,1)
    [a,b,c] = aryule(y, 1);
    [h,z] = freqz(1, [1,-conj(a(2))], 1024);
    plot(z/pi,10*log(abs(h)));
    xlim([0 1])
    title('Estimated PSD using AR(1)')
    xlabel('Norm Frequency ($\pi$ rads)')
    ylabel('Power (db)');
subplot(1,2,2)
    [a,b,c] = aryule(y, 5);
    [h,z] = freqz(1, [1,-conj(a(2)),-conj(a(3)),-conj(a(4)),-conj(a(5))], 1024);
    plot(z/pi,10*log(abs(h)));
    xlim([0 1])
    title('Estimated PSD using AR(5)')
    xlabel('Norm Frequency ($\pi$ rads)')
    
%% ideal

fft_dm1911 = @(x) abs(fftshift(fft(x))).^2;
w = linspace(-1,1,(length(y))+1);
w = w(1:(end-1));

figure;
    plot(w, fft_dm1911(y));
    title('Zero Mean Signal');
    axis tight;
    ylabel('Mag of PSD')
    xlabel('Frequency (Hz)')