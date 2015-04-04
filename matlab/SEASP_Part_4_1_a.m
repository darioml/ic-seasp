close all
clear all

%% WLMA(1)
LENGTH = 1000;

b1= 1.5 + 1j;
b2= 2.5 - 0.5j;
x = randn([LENGTH+1 1]) + 1i*randn([LENGTH+1 1]);

wlma = zeros([LENGTH 1]);
for i=1:LENGTH
    wlma(i) = x(i+1) + b1*x(i) + b2*x(i);
end

plot(abs(wlma), '*')


[a,b,c] = p4_clms( x, wlma, 2, 0.01 );
plot(real(a'))


%% Testing

LENGTH = 1000;

b1 = 1.5 + 1j;
b2 = 2.5 - 0.5j;

x = sqrt(0.5)*[1 1j]*randn(2,LENGTH); %thank you http://www.mathworks.com/matlabcentral/newsreader/view_thread/32077

wlma = zeros(LENGTH, 1);
wlma(1) = x(1);
wlma(2:end) = x(2:end) + b1*x(1:end-1) + b2*conj(x(1:end-1));

figure;
[a,b,c] = p4_clms( x, wlma, 5, 0.01 );
plot(real(conj(a')))
figure
plot(imag(conj(a')))


%% TESTING ACLMS
LENGTH = 1000;

b1 = 1.5 + 1j;
b2 = 2.5 - 0.5j;

x = sqrt(0.5)*[1 1j]*randn(2,LENGTH); %thank you http://www.mathworks.com/matlabcentral/newsreader/view_thread/32077

wlma = zeros(LENGTH, 1);
wlma(1) = x(1);
wlma(2:end) = x(2:end) + b1*x(1:end-1) + b2*conj(x(1:end-1));
% wlma(1) = x(1);
% wlma(2) = x(2);
% wlma(3:end) = x(3:end) + b1*x(2:end-1) + b2*(x(1:end-2));


figure;
[a,b,~,~] = p4_aclms( x, wlma, 5, 0.01 );
plot(real(conj(a')))
figure
plot(imag(conj(a')))
figure
plot(real(conj(b')))
figure
plot(imag(conj(b')))