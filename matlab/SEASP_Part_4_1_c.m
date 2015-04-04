clear all
close all

test = p4_three_phase_power([1 1 1], [0 0 0], 50, 5000, 0:1000);
scatter(real(test),imag(test));
plot(real(test))

