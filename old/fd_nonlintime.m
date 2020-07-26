function [F] = fd_nonlintime(t,u)
    %% Parameter [1-8]
    d       = 0.3;      %% µm
    D       = 0.3;      %% 0.003 cm^2/s =>  0,3 µm^2/µs
    k1      = 1;        %% 1e+6 1/s > 1 1/µs
    k2      = 0.01;     %% 1e-8 cm^3/s => 0,01 µm^3/µs
    ND      = 1000;     %% 1e+15 1/cm^3 => 1000 1/µm^3
    SL      = 0.1;      %% 10 cm/s => 0,1 µm/µs
    SR      = 1000;     %% 1e+5 cm/s => 1000 µm/µs
    
    N = length(u)-1;
    k = k1+k2.*ND; %% k berechnen
    h = (d-0)/N;  %% Schritweite
    
    %% Spaltenvektor z befüllen/ erstellen
    z = (0:h:d)'; 
    %% Die wiederkehrenden Faktoren berechnen    
    L = ((2.*h.*SL/D)+ 2 + (k.*h.^2)/D).*(-1);
    R = ((2*h*SR/D)+ 2 + (k*h^2)/D)*(-1);
    b = ((k2*h^2)/D)*(-1);
    c = (2 + (k*h^2)/D)*(-1);
    %% rechte Hand Spalten Vektor b
    RightSide = ((s_time(z,t).*h.^2)./D);
    %% N erhöhen
    N = N+1;   
    %% Damit es übersichtlich ist die Teilbereiche berechen
    leftBoundaryVec = (L.*u(1))+(b.*u(1).^2) + (2.*u(2));
    rightBoundaryVec = (2*u(N-1)) + (R*u(N))+(b*u(N)^2) ;
    middleVec = (u(1:N-2))+(c.*u(1+1:N-1))+(b.*u(1+1:N-1).^2)+(u(1+2:N));
    
    %% F erstellen und füllen
    F = ones(N,1);
    F(1) = leftBoundaryVec;
    F(N) = rightBoundaryVec;
    F(2:N-1) = middleVec;
    F = F + RightSide;
    F = (D/h.^2).* F;
end

function [sz] = s_time(z,t)
    %% Parameter [1-8]
    alpha   = 10;       %% 1e+5 cm => 10 µm
    %% 
    global S0
    %S0= 1e+4;
    sz = S0.*exp(-(t^2/(2*0.01^2)))*exp(-alpha*z);
end


