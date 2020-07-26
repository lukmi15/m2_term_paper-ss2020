% Bearbeiter_A = Fabian Rod

function [J] = fd_nonlin_jac(u,N)
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
    
    %% Anpassung der Größe N + 1
    N = N+1;
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
end