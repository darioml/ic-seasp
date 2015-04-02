clear all
close all

%% Let's experiment with different ro, alpha values.

ALGORITHM = 2;
%RO_VALUES = [0.001 0.005 0.01 0.05 0.1 .5 1];
RO_VALUES = [0.001 0.005 0.01];
%ALPHA_VALUES = [0.001 0.005 0.01 0.05 0.1 .5 1];
%ALPHA_VALUES = [.1 .6 .8 .85 .9 1];
ALPHA_VALUES = [.75 .85 .9];
ITERATIONS = 100;

if ALGORITHM ~= 2
    ALPHA_VALUES = 0;
end

for ro_local = RO_VALUES
    figure; hold all; grid on
    title(sprintf('Algorithm # %i, RO = %0.4f',ALGORITHM,ro_local));
    for alpha_local = ALPHA_VALUES
        weights = zeros(ITERATIONS,1001);
        for i=1:ITERATIONS
            passed = false;
            while (passed == false)
                wgn = sqrt(0.5)*randn([1000 1]);
                x = filter([1 0.9],1,wgn)';
                [w, ~, ~] = lms_ma_gss(wgn',x,1,ALGORITHM,ro_local,alpha_local);
                if (~any(isnan(w)))
                    passed=true;
                    weights(i,:) = w;
                else 
                    fprintf('failed for ro = %i apha=%i ITER %i\n', ro_local, alpha_local, i);
                end
            end
        end
        
        fprintf('Alpha: %i; Ro: %i\n', alpha_local, ro_local);
        if (length(ALPHA_VALUES) > 1)
            plot(mean(weights), 'DisplayName', sprintf('Alpha = %0.3f', alpha_local));
        else
            plot(mean(weights));
        end
    end
    if (length(ALPHA_VALUES) > 1)
        legend(gca,'show','Location','Best')
    end
end


%% GRAPH DIFFERENCES for 3.2.a

output_mu1 = zeros(100,1001);
output_mu01= zeros(100,1001);
output_a1  = zeros(100,1001);
output_a2  = zeros(100,1001);
output_a3  = zeros(100,1001);
for i=1:100,
    wgn = sqrt(0.5)*randn([1000 1]);
    x = filter([1 0.9],1,wgn)';
    
    [output_mu1(i,:) , ~, ~] = lms_ma(wgn',x,1,0.1);
    [output_mu01(i,:), ~, ~] = lms_ma(wgn',x,1,0.01);
    [output_a1(i,:)  , ~, ~] = lms_ma_gss(wgn',x,1,1,0.001,0);
    [output_a2(i,:)  , ~, ~] = lms_ma_gss(wgn',x,1,2,0.005,0.85);
    [output_a3(i,:)  , ~, ~] = lms_ma_gss(wgn',x,1,3,0.005,0);
end

figure; hold all; grid on;

plot(0.9-mean(output_mu1), 'DisplayName', 'LMS mu = 0.1')
plot(0.9-mean(output_mu01),'DisplayName', 'LMS mu = 0.01')
plot(0.9-mean(output_a1), 'DisplayName', 'Benveniste, ro = 0.001')
plot(0.9-mean(output_a2), 'DisplayName', 'Ang and Farhang, ro=0.005, alpha=0.85')
plot(0.9-mean(output_a3), 'DisplayName', 'Matthews and Xie, ro=0.005')

legend(gca,'show','Location','Best')

