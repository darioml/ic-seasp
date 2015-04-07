function [ x ] = p1_singen( f, fs, N )
    x = sin(2*pi*(f/fs)*(0:(N-1)));
end

