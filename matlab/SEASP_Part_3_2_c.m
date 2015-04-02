clear all
close all

%% Let's experiment!

mu = 0.01;

wgn = sqrt(0.5)*randn([1000 1]);
x = filter([1 0.9],1,wgn)';

[weight, error, pred_out] = lms_ma(wgn',x,1,0.01);


figure
plot(0.9-weight)