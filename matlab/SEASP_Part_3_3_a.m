clear all
close all

%% Generate graph - I'm going to for each M, compare values of delta
SAMPLES = 1000;

M_VALS = [2];
D_VALS = [1 2 3 4 25];

trials = 100;

x = sin(0.005*pi*[0:1:SAMPLES-1])';

for m_local = M_VALS
    figure;
    title(sprintf('Predicted Output'));
    for d_locali =1:length(D_VALS)
        d_local = D_VALS(d_locali);
        outputs = zeros(trials,1000);
        error = zeros(trials,1000);
        for i=1:trials
            v = randn(1,N+2);
            n = v(3:end)+0.5*v(1:end-2);
            %n = filter([1 0 0.5],1,randn([SAMPLES 1]));
            s = x+n';
            [~,error(i,:),outputs(i,:)] = ale_lms( s, 0.05, m_local, d_local);
        end
        subplot(1,length(D_VALS),d_locali);
            hold all;
            plot(x);
            plot(mean(outputs));
            title(sprintf('Output with $\\Delta$ = %i', d_local))
            ylabel('Output');
            xlabel('Sample No (N)');
            
           
            MPSE = mean(mean(error(i,(100):end).^2))        
        %fprintf('MPSE = %0.2f
%         subplot(2,length(D_VALS),length(D_VALS)+d_locali);
%             plot(10*log10(mean(error.^2)));
%             title(sprintf('Error $\\Delta$ = %i', d_local  ))
%             ylabel('Error Square (dB)');
%             xlabel('Sample No (N)');
        
        
    end
end
hold all; 



%%

clear all
close all
clc

set(0,'DefaultAxesFontName', 'CMU Serif')
set(0,'DefaultTextFontname', 'CMU Serif')
set(0,'DefaultTextInterpreter','latex')

set(0,'DefaultAxesFontsize',10)
addpath('Export')
