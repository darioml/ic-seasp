clear all
close all

%% Let's experiment!

mu = 0.01;

wgn = sqrt(0.5)*randn([1000 1]);
x = filter([1 0.9],1,wgn)';

[weight, error, pred_out] = lms_ma_gngd(wgn',x,1,0.01,1);


figure
plot(0.9-weight)

%% compare them here


output_benv = zeros(100,1001);
output_gngd = zeros(100,1001);
for i=1:100,
    wgn = sqrt(0.5)*randn([1000 1]);
    x = filter([1 0.9],1,wgn)';
    
    [output_benv(i,:) , ~, ~] = lms_ma_gss(wgn',x,1,1,0.001,0);
    [output_gngd(i,:), ~, ~]  = lms_ma_gngd(wgn',x,1,0.001,1);
end

figure; hold all; grid on;

plot(0.9-mean(output_benv), 'DisplayName', 'Benveniste')
plot(0.9-mean(output_gngd),'DisplayName', 'GNGD')

title('A comparison of LMS and Adaptive Step Sizes for LMS Algorithm')
xlabel('Iteraion (N)')
ylabel('Weight Error')

legend(gca,'show','Location','Best')



%% compare them here


output_benv = zeros(100,1001);
output_gngd = zeros(100,1001);
for i=1:500,
    wgn = sqrt(0.5)*randn([1000 1]);
    x = filter([1 0.9],1,wgn)';
    
    [output_benv(i,:) , ~, ~] = lms_ma_gss(wgn',x,1,1,0.001,0);
    [output_gngd(i,:), ~, ~]  = lms_ma_gngd_2(wgn',x,1,0.001,1);
end

figure; hold all; grid on;

plot(0.9-mean(output_benv), 'DisplayName', 'Benveniste, $\mu = 0.001$')
plot(0.9-mean(output_gngd),'DisplayName', 'GNGD, $\rho=1$, $\mu = 0.001$')

title('A comparison of Benveniste and GNGD Algorithm')
xlabel('Iteraion (N)')
ylabel('Weight Error ($w_0 - w(n)$)')
xlim([0 1000])
ylim([-1 1])

legend(gca,'show','Location','Best')
