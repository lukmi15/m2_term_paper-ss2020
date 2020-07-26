% Bearbeiter_A = Fabian Rod

function [sz] = s_time(z,t)
    %% Parameter [1-8]
    alpha   = 10;       %% 1e+5 cm => 10 µm
    %% 
    global S0
    %S0= 1e+4;
    sz = S0.*exp(-(t^2/(2*0.01^2)))*exp(-alpha*z);
end

