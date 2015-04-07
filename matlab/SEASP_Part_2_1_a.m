clear all
close all

N = 1000;
f_s=1000;

wgn = randn([N 1]);
sin = sin(2*pi*30/f_s*(0:(N-1)))' + sqrt(0.25)*randn([N 1]);
fwgn= filter(1, [1 0.5 0.2], randn([N 1]) );


