% Bearbeiter_A = Fabian Rod

function [F] = fd_nonlin(u,N)
    %% Parameter [1-8]
    global P;
    d       = P(1);     
    D       = P(2);    
    k1      = P(3);       
    k2      = P(4);      
    ND      = P(5);     
    SL      = P(6);       
    SR      = P(7);      
%   alpha   = P(8);        
    
    k = k1+k2*ND; %% k berechnen
    h = (d-0)/N;  %% Schritweite
    
    %% Die wiederkehrenden Faktoren berechnen
    L = ((2*h*SL/D)+ 2 + (k*h^2)/D)*-1;
    R = ((2*h*SR/D)+ 2 + (k*h^2)/D)*-1;
    b = ((k2*h^2)/D)*-1;
    c = (2 + (k*h^2)/D)*-1;
    
    %% N erhöhen
    N = N+1;
    
    %% Damit es übersichtlich ist die Teilbereiche berechen
    leftBoundaryVec = (L*u(1))+(b*u(1)^2) + (2*u(2));
    rightBoundaryVec = (2*u(N-1)) + (R*u(N))+(b*u(N)^2) ;
    middleVec = (u(1:N-2))+(c.*u(1+1:N-1))+(b.*u(1+1:N-1).^2)+(u(1+2:N));
    
    %% F erstellen und füllen
    F = ones(N,1);
    F(1) = leftBoundaryVec;
    F(N) = rightBoundaryVec;
    F(2:N-1) = middleVec;
end