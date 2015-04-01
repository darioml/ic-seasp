clear all
close all

%% 1 iteration, mu = 0.05
mu = 0.05;
wgn = sqrt(0.25)*randn([1000 1]);
x = filter(1,[1 -0.1 -0.8],wgn)';
[~, e, ~] = lms_test(x, mu);
figure
plot(10*log10(e.^2))
title(sprintf('Error for $\\mu$ = %0.2f', mu));
xlabel('Iteration');
ylabel('Squared Prediction Error (dB)');



%% 1 iteration, mu = 0.01
mu = 0.01;
wgn = sqrt(0.25)*randn([1000 1]);
x = filter(1,[1 -0.1 -0.8],wgn)';
[~, e, ~] = lms_test(x, mu);
figure
plot(10*log10(e.^2))
title(sprintf('Error for $\\mu$ = %0.2f', mu));
xlabel('Iteration');
ylabel('Squared Prediction Error (dB)');



%% 100 iterations, mu = 0.05
error = zeros(100,1000);
mu = 0.05;
for i=1:100
    wgn = sqrt(0.25)*randn([1000 1]);
    x = filter(1,[1 -0.1 -0.8],wgn)';
    [y, error(i,:), a] = lms_test(x, mu);
end


figure
plot(10*log10(mean(error.^2)))
title(sprintf('Error for $\\mu$ = %0.2f over 100 iterations', mu));
xlabel('Iteration');
ylabel('Squared Prediction Error (dB)');



%% 100 iterations, mu = 0.01
error = zeros(100,1000);
for i=1:100
    mu = 0.01;
    wgn = sqrt(0.25)*randn([1000 1]);
    x = filter(1,[1 -0.1 -0.8],wgn)';
    [~, error(i,:), ~] = lms_test(x, mu);
end

figure
plot(10*log10(mean(error.^2)))
title(sprintf('Error for $\\mu$ = %0.2f over 100 iterations', mu));
xlabel('Iteration');
ylabel('Squared Prediction Error (dB)');



%% Extra

% plot(a');
% title('LMS Estimation of AR/IIR filter coefficients');
% xlabel('Samples');
% ylabel('Filter Value');
% mean(a(1, 900:1000))
% mean(a(2, 900:1000))

