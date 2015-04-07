clear all
close all


%% wind data

wind_data_l = load('wind-dataset/low-wind.mat');
wind_data_m = load('wind-dataset/medium-wind.mat');
wind_data_h = load('wind-dataset/high-wind.mat');

figure;

v_low = wind_data_l.v_east + 1j*wind_data_l.v_north;
    subplot(131);
    scatter(real(v_low), imag(v_low));
    title('Circularity Plot (Low)')
    xlabel('Real ($\Re$)'); xlim([-0.4 0.4]); ylim([-0.4 0.4]);
    ylabel('Immaginary ($\Im$)')
    set(gcf,'color','w');

v_med = wind_data_m.v_east + 1j*wind_data_m.v_north;
    subplot(132);
    scatter(real(v_med), imag(v_med));
    title('Circularity Plot (Low)')
    xlabel('Real ($\Re$)');  xlim([-2 2]); ylim([-2 2]);
    ylabel('Immaginary ($\Im$)')
    set(gcf,'color','w');

v_high = wind_data_h.v_east + 1j*wind_data_h.v_north;
    subplot(133);
    scatter(real(v_high), imag(v_high));
    title('Circularity Plot (Low)')
    xlabel('Real ($\Re$)');  xlim([-4 4]); ylim([-4 4]);
    ylabel('Immaginary ($\Im$)')
    set(gcf,'color','w');
    
%% Error stuff

LENGTH = 5000;

wind_data_l = load('wind-dataset/low-wind.mat');
wind_data_m = load('wind-dataset/medium-wind.mat');
wind_data_h = load('wind-dataset/high-wind.mat');
v_low = wind_data_l.v_east  + 1j*wind_data_l.v_north;
v_med = wind_data_m.v_east  + 1j*wind_data_m.v_north;
v_high = wind_data_h.v_east + 1j*wind_data_h.v_north;


figure;

error_clms = zeros(19, 1);
error_aclms = zeros(19, 1);
for order=2:20
    [~,er,~] = p4_clms( v_low(1:end-1), v_low(2:end), order, 0.01 );
    error_clms(order-1,:) = mean(er(end-100:end));
    [~,~,er,~] = p4_aclms( v_low(1:end-1), v_low(2:end), order, 0.01 );
    error_aclms(order-1,:) = mean(er(end-100:end));
end
subplot(131);
    plot(2:20, 10*log10(abs(error_clms).^2), '*-');hold all;
    plot(2:20, 10*log10(abs(error_aclms).^2), 'o-');
    legend('CLMS', 'ACLMS');
    title('Predictive Modeling (Low)')
    xlabel('Filter Order');
    ylabel('Steady State Mean Squared Error (dB)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');
    

error_clms = zeros(19, 1);
error_aclms = zeros(19, 1);
for order=2:20
    [~,er,~] = p4_clms( v_med(1:end-1), v_med(2:end), order, 0.01 );
    error_clms(order-1,:) = mean(er(end-100:end));
    [~,~,er,~] = p4_aclms( v_med(1:end-1), v_med(2:end), order, 0.01 );
    error_aclms(order-1,:) = mean(er(end-100:end));
end
subplot(132);
    plot(2:20, 10*log10(abs(error_clms).^2), '*-');hold all;
    plot(2:20, 10*log10(abs(error_aclms).^2), 'o-');
    legend('CLMS', 'ACLMS');
    title('Predictive Modeling (Med)')
    xlabel('Filter Order');
    ylabel('Steady State Mean Squared Error (dB)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');


    
    
    
error_clms = zeros(19, 1);
error_aclms = zeros(19, 1);
for order=2:20
    [~,er,~] = p4_clms( v_high(1:end-1), v_high(2:end), order, 0.01 );
    error_clms(order-1,:) = mean(er(end-100:end));
    [~,~,er,~] = p4_aclms( v_high(1:end-1), v_high(2:end), order, 0.01 );
    error_aclms(order-1,:) = mean(er(end-100:end));
end
subplot(133);
    plot(2:20, 10*log10(abs(error_clms).^2), '*-');hold all;
    plot(2:20, 10*log10(abs(error_aclms).^2), 'o-');
    legend('CLMS', 'ACLMS');
    title('Predictive Modeling (High)')
    xlabel('Filter Order');
    ylabel('Steady State Mean Squared Error (dB)');
    set(gca,'TickDir','out');
    set(gca,'Box','off');
    set(gcf,'color','w');