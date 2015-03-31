clear all
close all

%% Let's experiment!

mu = 0.01;
wgn = 0.25*randn([6000 1]);
x = filter(1,[1 -0.9],wgn)';
[y, e, a] = gngd_lms(x,1,0.01);
figure
hold all
plot(a(:,1))