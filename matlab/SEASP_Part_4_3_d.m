
clear all
close all

%% do stuff

load('EEG_Data/EEG_Data_Assignment1.mat');
y = [POz(90000:91200-1); zeros(1200,1)];

N = length(y);
x = zeros(N,N);

for n=1:N
    x(:,n) = (1/N) * exp( 1j * (2*n*(0:(N-1))*pi) / N );
end


[ weights, error, pred_out ] = p4_dft_clms( y, x, 1 );

H = abs(weights).^2;
medianH = 50*median(median(H));
H(H>medianH) = medianH;

surf(H, 'LineStyle','none');
view(2)

title('DFT-CLMS for POz')
xlabel('Time');
ylabel('Frequency (Hz)')