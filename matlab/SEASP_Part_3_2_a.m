clear all
close all

%% Let's experiment!

mu = 0.01;
wgn = 0.25*randn([2000 1]);
x = filter(1,[1 -0.9],wgn)';
[y, e, a] = gass_lms(x, 3, 0.005, 0.8);
figure
hold all
plot(a(:,1))
plot(a(:,2))

