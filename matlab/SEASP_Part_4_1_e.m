clear all
close all


%% BIASED
unbiased = p4_three_phase_power([1 1 1], [0 0 0], 50, 5000, 0:1000);
[a,b,c] = p4_clms_ar(unbiased, 1, 0.01);
f_out = (5000/(2*pi))*atan(imag(a)./real(a));
plot(f_out);


%% UNBIASED
biased = p4_three_phase_power([1 1 1], [0 0 0], 50, 5000, 0:1000);
[a,b,c,d] = p4_aclms_ar(biased, 1, 0.01);

f_out = (5000/(2*pi))*atan(      sqrt( (imag(a).^2) - (abs(b).^2 ))   ./  real(a)       );
plot(real(f_out(4:end)));

