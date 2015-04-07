clear all
close all


%% BIASED
figure;
subplot(121);
hold all;

unbiased = p4_three_phase_power([1 1 1], [0 0 0], 50, 5000, 0:1000);
[a,b,c] = p4_clms( unbiased(1:end-1), unbiased(2:end), 1, 0.01 );
f_out = (5000/(2*pi))*atan(imag(conj(a))./real(a));
plot(f_out);
[a,b,c,d] = p4_aclms( unbiased(1:end-1), unbiased(2:end), 1, 0.01 );
f_out = (5000/(2*pi))*atan(      sqrt( (imag(a).^2) - (abs(b).^2 ))   ./  real(a)       );
plot(real(f_out(4:end)));
legend('CLMS', 'ACLMS');
xlim([0 1000])

xlabel('Iteration (N)')
ylabel('Frequency ($f_0$)')
title('Balanced System')


%% UNBIASED
subplot(122);
hold all;

biased = p4_three_phase_power([.8 5 .8], [0 pi/4 pi/8], 50, 5000, 0:1000);
[a,b,c] = p4_clms( unbiased(1:end-1), unbiased(2:end), 1, 0.01 );
f_out = (5000/(2*pi))*atan(imag(conj(a))./real(a));
plot(f_out);
[a,b,c,d] = p4_aclms( biased(1:end-1), biased(2:end), 1, 0.01 );

f_out = (5000/(2*pi))*atan(      sqrt( (imag(a).^2) - (abs(b).^2 ))   ./  real(a)       );
plot(real(f_out(4:end)));
legend('CLMS', 'ACLMS');
xlim([0 1000])

xlabel('Iteration (N)')
ylabel('Frequency ($f_0$)')
title('Unbalanced System')