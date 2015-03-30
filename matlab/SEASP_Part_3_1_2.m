clear all

wgn = randn([1000 1]);

x = filter([1], [1 0.1 0.8], wgn);

[y, e, a] = SEASP_Part_3_lms(x, 0.01, 2);

plot(a');
title('LMS Estimation of AR/IIR filter coefficients');
xlabel('Samples');
ylabel('Filter Value');

mean(a(1, 900:1000))
mean(a(2, 900:1000))

