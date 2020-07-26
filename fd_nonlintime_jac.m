function [J] = fd_nonlintime_jac(t,u)
    %% Parameter [1-8]
    d       = 0.3;      %% µm
    D       = 0.3;      %% 0.003 cm^2/s =>  0,3 µm^2/µs
    k1      = 1;        %% 1e+6 1/s > 1 1/µs
    k2      = 0.01;     %% 1e-8 cm^3/s => 0,01 µm^3/µs
    ND      = 1000;     %% 1e+15 1/cm^3 => 1000 1/µm^3
    SL      = 0.1;      %% 10 cm/s => 0,1 µm/µs
    SR      = 1000;     %% 1e+5 cm/s => 1000 µm/µs
    
    N = length(u);
    k = k1+k2*ND; %% k berechnen
    h = (d-0)/N;  %% Schritweite
    
    %% Die wiederkehrenden Faktoren berechnen
    L = ((2*h*SL/D)+ 2 + (k*h^2)/D)*(-1);
    R = ((2*h*SR/D)+ 2 + (k*h^2)/D)*(-1);
    b = ((k2*h^2)/D)*(-1);
    c = (2 + (k*h^2)/D)*(-1);
    
    %% Anpassung der Größe N + 1
    N = N;
    %% Vektoren
    leftVec = ones(N,1);
    rightVec = ones(N,1);
    
    middleInnerNodes = (c)+(2.*b.*u(1:N));
    middleVec = middleInnerNodes;
    middleVec(1,1) = (L)+(2*b*u(1));
    middleVec(N,1) = (R)+(2*b*u(N));
    
    %% Randbedingungen mit 2
    leftVec(N-1,1) = 2;
    rightVec(2,1) = 2;
    
    J = spdiags([leftVec middleVec rightVec], -1:1,N,N);
    J = (D/h^2)* J;

end

