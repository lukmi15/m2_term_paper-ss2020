% Bearbeiter_A = Fabian Rod

function [P] = parametervektor()
%% Parameter [1-8]
    d       = 0.3;      %% µm
    D       = 0.3;      %% 0.003 cm^2/s =>  0,3 µm^2/µs
    k1      = 1;        %% 1e+6 1/s > 1 1/µs
    k2      = 0.01;     %% 1e-8 cm^3/s => 0,01 µm^3/µs
    ND      = 1000;     %% 1e+15 1/cm^3 => 1000 1/µm^3
    SL      = 0.1;      %% 10 cm/s => 0,1 µm/µs
    SR      = 1000;     %% 1e+5 cm/s => 1000 µm/µs
    alpha   = 10;       %% 1e+5 cm => 10 µm
    P = ones(8,1);
    
    P(1,1) = d;
    P(2,1) = D;
    P(3,1) = k1;
    P(4,1) = k2;
    P(5,1) = ND;
    P(6,1) = SL;
    P(7,1) = SR;
    P(8,1) = alpha;  
end