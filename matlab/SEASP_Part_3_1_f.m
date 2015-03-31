clear all
close all


%% Finding EMSE and M for both mu=0.01
mu = 0.01;
est_vars_1 = zeros(100,1000);
est_vars_2 = zeros(100,1000);

for i=1:100
    wgn = 0.25*randn([1000 1]);
    x = filter(1,[1 -0.1 -0.8],wgn)';
    [~, ~, a] = leaky_lms(x, mu, 0.05);
    est_vars_1(i,:) = a(:,1);
    est_vars_2(i,:) = a(:,2);
end

fprintf('For mu = %0.2f, calculated a_1= %0.2f, a_2= %0.2f\n', mu, mean(est_vars_1(end-50:end)), mean(est_vars_2(end-50:end)));


%% Finding EMSE and M for both mu=0.05
mu = 0.01;
est_vars_1 = zeros(100,1000);
est_vars_2 = zeros(100,1000);

for i=1:100
    wgn = 0.25*randn([1000 1]);
    x = filter(1,[1 -0.1 -0.8],wgn)';
    [~, ~, a] = leaky_lms(x, mu, 0.05);
    est_vars_1(i,:) = a(:,1);
    est_vars_2(i,:) = a(:,2);
end

fprintf('For mu = %0.2f, calculated a_1= %0.2f, a_2= %0.2f\n', mu, mean(est_vars_1(end-50:end)), mean(est_vars_2(end-50:end)));



