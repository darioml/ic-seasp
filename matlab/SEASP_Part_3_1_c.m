clear all
close all


%% Finding EMSE and M for both mu=0.01
mu = 0.01;
error = zeros(100,1000);
for i=1:100
    wgn = 0.25*randn([1000 1]);
    x = filter(1,[1 -0.1 -0.8],wgn)';
    [~, error(i,:), ~] = lms_test(x, mu);
end
meanError = mean(error.^2);
fprintf('mu  =%0.6f\n', mu);
fprintf('MSE =%0.6f\n', mean(meanError(end-100:end)) );
fprintf('EMSE=%0.6f\n', mean(meanError(end-100:end)) - 0.25);
fprintf('M   =%0.6f\n\n\n', (mean(meanError(end-50:end)) - 0.25) / 0.25);


%% Finding EMSE and M for both mu=0.05
mu = 0.05;
error = zeros(100,1000);
for i=1:100
    wgn = 0.25*randn([1000 1]);
    x = filter(1,[1 -0.1 -0.8],wgn)';
    [~, error(i,:), ~] = lms_test(x, mu);
end
meanError = mean(error.^2);
fprintf('mu  =%0.6f\n', mu);
fprintf('MSE =%0.6f\n', mean(meanError(end-100:end)) );
fprintf('EMSE=%0.6f\n', mean(meanError(end-100:end)) - 0.25);
fprintf('M   =%0.6f\n\n', (mean(meanError(end-50:end)) - 0.25) / 0.25);


