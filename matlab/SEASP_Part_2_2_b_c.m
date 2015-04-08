clear all
close all

%%

samples = 10000;

xn = filter([1], [1 -2.76 +3.81 -2.65 +0.92], randn([samples 1]));

xn = xn(501:end);

orders = [2 5 14];

for i=1:length(orders)
    localOrder = orders(i);
    
    pxx = pyulear(xn, localOrder, 2^(nextpow2(samples)));
    
    subplot(1,length(orders),i);
    plot( linspace(0,1,length(pxx)), pxx)
    title(sprintf('Spectrum Estimate (AR(%i))', localOrder));
    xlabel('Frequency ($\pi$ rads)')
    ylabel('Amplitude')
end