clear all
close all


%% wind data

wind_data_l = load('wind-dataset/low-wind.mat');
wind_data_m = load('wind-dataset/medium-wind.mat');
wind_data_h = load('wind-dataset/high-wind.mat');

v_low = wind_data_l.v_east + 1j*wind_data_l.v_north;
figure;
    scatter(real(v_low), imag(v_low));

v_med = wind_data_m.v_east + 1j*wind_data_m.v_north;
figure;
    scatter(real(v_med), imag(v_med));

v_high = wind_data_h.v_east + 1j*wind_data_h.v_north;
figure;
    scatter(real(v_high), imag(v_high));