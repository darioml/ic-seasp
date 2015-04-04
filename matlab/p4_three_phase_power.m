function [ v ] = p4_three_phase_power( Voltages, Phases, fo, fs, n )
%P4_THREE_PHASE_POWER Summary of this function goes here
%   Detailed explanation goes here
    
    A = (sqrt(6)/6) * (Voltages(1) + Voltages(2)*exp(1j*Phases(2)) + Voltages(3)*exp(1j*Phases(3)) );
    B = (sqrt(6)/6) * (Voltages(1) + Voltages(2)*exp(-1j*(Phases(2) + (2*pi/3) )) + Voltages(3)*exp(-1j*(Phases(3) - (2*pi/3))) );

    v = A*exp(1j*(2*pi*fo*n/fs + Phases(1))) + B*exp(-1j*(2*pi*fo*n/fs + Phases(1)));
end

