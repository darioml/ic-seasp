clear all
close all

M_VALS = [2 5 10 15 20];
D_VALS = [2 5 10 15 20 25];

%% Generate graph - I'm going to for each M, compare values of delta
SAMPLES = 1000;

x = sin(0.01*pi*[0:1:SAMPLES-1])';
for m_local = M_VALS
    figure;
    title(sprintf('Predicted Output'));
    hold all;
    plot(x);
    for d_local = D_VALS
        outputs = zeros(100,1000);
        for i=1:100
            n = filter([1 0 0.5],1,randn([SAMPLES 1]));
            s = x+n;
            [~,~,outputs(i,:)] = ale_lms( s, 0.01, 4, 5);
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
        for i=1:500
            n = filter([1 0 0.5],1,randn([SAMPLES 1]));
            s = x+n;
            [~,~,outputs(i,:)] = ale_lms( s, 0.01, M_VALS(m_local_i), D_VALS(d_local_i));
        end
        [m_local_i d_local_i]
        MSPE(m_local_i,d_local_i) = (1/1000) * sum((x' - mean(outputs)).^2);
    end
    end0

plot(MSPE)


