clear all
close all

%%  get signal from 4.2.a

SEASP_Part_4_2_a

%% do stuff

[ weights, error, pred_out ] = p4_clms_ar( y, 1024, 1 );
weights = abs(weights);
medianH                  = 50*median(median(weights));
weights(weights>medianH) = medianH;

N=1024;
input = zeros(N,1500);
for n=1:1500
    input(:,n) = (1/N)*(exp(1j*n*(2*pi*(0:(N-1))'/N)));
end

[ weights, error, pred_out ] = p4_dft_clms( input );

H = abs(weights);
surf(H, 'LineStyle','none');
