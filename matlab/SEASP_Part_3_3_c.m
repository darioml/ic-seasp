clear all
close all

%% Generate signals
SAMPLES = 1000;

x = sin(0.01*pi*[0:1:SAMPLES-1])';
outputs = zeros(100,1000);
for i=1:100
    n = filter([1 0 0.5],1,randn([SAMPLES 1]));
    s = x+n;
    [~,outputs(i,:),~] = anc_lms( s, randn([SAMPLES 1]), 0.01, 5);
end
plot(mean(outputs)); hold all; plot(x);