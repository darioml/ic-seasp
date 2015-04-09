clear all
close all

%%

samples = 10000;


test = randn([samples 1]);
xn = filter(1, [1 -2.76 +3.81 -2.65 +0.92], test);

xn = xn(501:end);


x(1) = test(1);
x(2) = 2.76*x(1) + test(2);
x(3) = 2.76*x(2) - 3.81*x(1) + test(3);
x(4) = 2.76*x(3) - 3.81*x(2) + 2.65*x(3) + test(4);

for i = 5:samples
    x(i) = 2.76*x(i-1) - 3.81*x(i-2) + 2.65*x(i-3) - 0.92*x(i-4) + test(i);
end


orders = [2 4 14];

for i=1:length(orders)
    localOrder = orders(i);
    
    pxx = pyulear(xn, localOrder, 2^(nextpow2(samples)));
    
    subplot(1,length(orders),i);
    plot( linspace(0,1,length(pxx)), pxx)
    title(sprintf('Spectrum Estimate (AR(%i))', localOrder));
    xlabel('Frequency ($\pi$ rads)')
    ylabel('Amplitude')
end