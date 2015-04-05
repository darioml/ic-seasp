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

[a,b,c] = aryule(y, 1);



