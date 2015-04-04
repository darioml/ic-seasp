clear all
close all

%% 1 iteration, mu = 0.05 and 0.01
mu = 0.05;
wgn = sqrt(0.25)*randn([1000 1]);
x = filter(1,[1 -0.1 -0.8],wgn)';
[~, e, ~] = lms_test(x, mu);
figure; grid on;
plot(10*log10(e.^2), 'DisplayName', sprintf('for \\mu = %0.2f', mu))
title(sprintf('Square Prediction Error over 1 Iteration'));
xlabel('Iteration');
ylabel('Squared Prediction Error (dB)');

mu = 0.01;
wgn = sqrt(0.25)*randn([1000 1]);
x = filter(1,[1 -0.1 -0.8],wgn)';
[~, e, ~] = lms_test(x, mu);
hold all
plot(10*log10(e.^2), 'DisplayName', sprintf('for \\mu = %0.2f', mu))
legend(gca,'show','Location','Best')
%export('3_1_b_1_iterations');


%% 100 iterations, mu = 0.05, mu = 0.01
error = zeros(100,1000);
mu = 0.05;
for i=1:100
    wgn = sqrt(0.25)*randn([1000 1]);
    x = filter(1,[1 -0.1 -0.8],wgn)';
    [y, error(i,:), a] = lms_test(x, mu);
end


figure; grid on;
plot(10*log10(mean(error.^2)), 'DisplayName', sprintf('for \\mu = %0.2f', mu))
title(sprintf('Square Prediction Error over 100 Iteration'));
xlabel('Iteration');
ylabel('Squared Prediction Error (dB)');



error = zeros(100,1000);
for i=1:100
    mu = 0.01;
    wgn = sqrt(0.25)*randn([1000 1]);
    x = filter(1,[1 -0.1 -0.8],wgn)';
    [~, error(i,:), ~] = lms_test(x, mu);
end

hold all
plot(10*log10(mean(error.^2)), 'DisplayName', sprintf('for \\mu = %0.2f', mu))
xlabel('Iteration');
ylabel('Squared Prediction Error (dB)');
legend(gca,'show','Location','Best')
%export('3_1_b_100_iterations');




