clear all
close all

f_0 = 0.2;
x_n = @(a_1, a_2, phi_1, phi_2, sigma2, alpha, N) a_1*sin(f_0*2*pi*(0:(N-1)) + phi_1) + ...
    a_2*sin((f_0+alpha/N)*2*pi*(0:(N-1)) + phi_2) + sqrt(sigma2)*randn([1 N]);

plot(x_n(1, 0, 0, 0, 0, 1, 1000))
