clear all
close all

%% Generate signals
SAMPLES = 1000;

x = sin(0.01*pi*[0:1:SAMPLES-1])';
errors_anc = zeros(100,1000);
for i=1:100
    n = filter([1 0 0.5],1,randn([SAMPLES 1]));
    s = x+n;
    [~,~,errors_anc(i,:)] = anc_lms( s, randn([SAMPLES 1]), 0.01, 5);
end


errors_ale = zeros(100,1000);
for i=1:100
    n = filter([1 0 0.5],1,randn([SAMPLES 1]));
    s = x+n;
    [~,~,errors_ale(i,:)] = ale_lms( s, 0.01, 5, 2 );
end



%% compare
figure
hold all; 
plot(mean(errors_anc.^2)); 
plot(mean(errors_ale.^2));

title('Comparison of ANC and ALE')
xlabel('Sample Number (N)')
ylabel('MPCE over each sample')

legend('ANC, $\mu = 0.01$, $M$ = 5', 'ALE, $\mu = 0.01$, $M$ = 5, $\Delta$ = 2')