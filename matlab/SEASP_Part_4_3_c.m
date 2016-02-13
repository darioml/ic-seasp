%%  get signal from 4.2.a

SEASP_Part_4_2_a
close all

%% do stuff


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