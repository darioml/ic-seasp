close all
clear all

%% WLMA(1)
LENGTH = 1000;

b1= 1.5 + 1j;
b2= 2.5 - 0.5j;
x = sqrt(0.5)*[1 1j]*randn(2,LENGTH);


wlma = zeros(LENGTH, 1);
wlma(1) = x(1);
wlma(2:end) = x(2:end) + (b1*x(1:end-1)) + (b2*conj(x(1:end-1)));



[weights,error,~] = p4_clms( x, wlma, 2, 0.01 );
plot(real(weights')); hold all;
plot(imag(weights'));
title('CLMS Algorithm Weights');
xlabel('Iteration (N)');
ylabel('Weight Value (w)');

legend('Real Coefficient 1', 'Real Coefficient 2', 'Imaginary Coefficient 1', 'Imaginary Coefficient 2');



%% TESTING ACLMS
LENGTH = 1000;

b1 = 1.5 + 1j;
b2 = 2.5 - 0.5j;

x = sqrt(0.5)*[1 1j]*randn(2,LENGTH); %thank you http://www.mathworks.com/matlabcentral/newsreader/view_thread/32077

wlma = zeros(LENGTH, 1);
wlma(1) = x(1);
wlma(2:end) = x(2:end) + b1*x(1:end-1) + b2*conj(x(1:end-1));



[a,b,~,~] = p4_aclms( x, wlma, 2, 0.01 );

figure;
plot(real(a')); hold all;
plot(imag(a'));

figure;
plot(real(b')); hold all;
plot(imag(b'));

% plot(real(conj(a')))
% figure
% plot(imag(conj(a')))
% figure
% plot(real(conj(b')))
% figure
% plot(imag(conj(b')))




%% let's put the errors on one graph..

N_iter = 100;
LENGTH = 10000;

error_clms = zeros(N_iter, LENGTH);
error_aclms = zeros(N_iter, LENGTH);

b1 = 1.5 + 1j;
b2 = 2.5 - 0.5j;

wlma = zeros(LENGTH, 1);
for i=1:N_iter
    x = sqrt(0.5)*[1 1j]*randn(2,LENGTH); %thank you http://www.mathworks.com/matlabcentral/newsreader/view_thread/32077
   
    wlma(1) = x(1);
    wlma(2:end) = x(2:end) + b1*x(1:end-1) + b2*conj(x(1:end-1));
    
    [~,error_clms(i,:),~] = p4_clms( x, wlma, 2, 0.01 );
    [~,~,error_aclms(i,:),~] = p4_aclms( x, wlma, 2, 0.01 );
    
end

figure
hold all;

plot( 10*log10( mean(abs(error_clms).^2) ) ) ;
plot( 10*log10( mean(abs(error_aclms).^2) ) ) ;

title('Comparison of CLMS and ACLMS for a WLMA(1) Process')
xlabel('Iteration (N)')
ylabel('Error ($10log_{10}(|e(n)|^2)$)')

legend('CLMS', 'ACLMS');
