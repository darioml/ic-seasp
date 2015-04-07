clear all
close all

figure;

test = p4_three_phase_power([1 1 1], [0 0 0], 50, 3000, 0:1000);
scatter(real(test),imag(test));
hold all;

test = p4_three_phase_power([.8 .8 .8], [0 pi/4 pi/8], 50, 3000, 0:1000);
scatter(real(test),imag(test));

title('Circularity Plot (Balanced and Unbalanced)');
    xlabel('Real ($\Re$)'); 
    ylabel('Immaginary ($\Im$)')
    
legend('Balanced', 'Unbalanced');