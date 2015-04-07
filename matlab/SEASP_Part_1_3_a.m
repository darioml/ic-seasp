clear all
close all

%%
fftsize = 10000;
N = 20;
x = bartlett(N);
fftshifted = abs(fftshift(fft(x, fftsize)));
stem(-fftsize/2:(fftsize/2)-1,fftshifted);

max = fftshifted(1+fftsize/2);
length(fftshifted(fftshifted> (max/2) ))

threedb = zeros(100,1);
sidelobe = zeros(100,1);
for n=3:100
    x = bartlett(n);
    fftshifted = abs(fftshift(fft(x, fftsize)));

    max = fftshifted(1+fftsize/2);
    threedb(n) = length(fftshifted(fftshifted> (max/2) ));
    
    x = findpeaks(fftshifted);
    if (length(x) > 3)
        sidelobe(n)= 10*log10(x((length(x)-1)/2));
    end
end

plot(3:100,threedb(3:end))
figure
plot(sidelobe)