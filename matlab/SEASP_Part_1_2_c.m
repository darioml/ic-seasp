clear all
close all

M = 10;
L = 256;

x = zeros(L,1);
for l=1:(M-1)
    x(l) = p1_rk(l-M,M);
end
for l=(M):(2*M)
    x(l) = p1_rk(l-M-1,M);
end

stem(x)

%% show ACF

figure
M = 80;
L = 256;
subplot(121);
x = zeros(L,1);
for l=1:(M-1)
    x(l) = p1_rk(l-M,M);
end
for l=(M):(2*M)
    x(l) = p1_rk(l-M-1,M);
end
plot(x); xlim([0 256])
title('Vector ($\textbf{z}(k)$)');
xlabel('k')
ylabel('r(k)')

subplot(122);
plot(-(L/2):((L/2)-1), [x(128:end)' x(1:127)']); xlim([-(L/2) ((L/2)-1)])
title('Equivalent ACF of $\textbf{z}(k)$');
xlabel('k')
ylabel('r(k)')