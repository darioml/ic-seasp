clear all
close all

M_VALS = [2 3 4 5 10 15 20];
D_VALS = [3 4 5 7 8 9 10 12 13 15 17 20 22 25];

%% Generate graph - I'm going to for each M, compare values of delta
SAMPLES = 1000;

x = sin(0.01*pi*[0:1:SAMPLES-1])';
for m_local = M_VALS
    figure;
    title(sprintf('Predicted Output'));
    hold all;
    plot(x);
    for d_local = D_VALS
        outputs = zeros(10,1000);
        for i=1:10
            n = filter([1 0 0.5],1,randn([SAMPLES 1]));
            s = x+n;
            [~,~,outputs(i,:)] = ale_lms( s, 0.1, 4, 5);
        end
        plot(mean(outputs), 'DisplayName', sprintf('d = %i', d_local));
    end
    legend(gca,'show','Location','Best')
end

hold all; 

%% Let's do some MSPE stuff

SAMPLES = 1000;

x = sin(0.01*pi*[0:1:SAMPLES-1])';
MSPE = zeros(length(M_VALS), length(D_VALS));
for m_local_i = 1:length(M_VALS)
    for d_local_i = 1:length(D_VALS)
        outputs = zeros(100,1000);
        for i=1:100
            n = filter([1 0 0.5],1,randn([SAMPLES 1]));
            s = x+n;
            [~,~,outputs(i,:)] = ale_lms( s, 0.01, M_VALS(m_local_i), D_VALS(d_local_i));
        end
        MSPE(m_local_i,d_local_i) = (1/1000) * sum((x' - mean(outputs)).^2);
    end
end

plot(D_VALS, MSPE', '*-')
legend('M = 2','M = 3','M = 4','M = 5','M = 10','M = 15','M = 20');

title('MPSE for ALE');
ylabel('MPSE')
xlabel('$\Delta$')
