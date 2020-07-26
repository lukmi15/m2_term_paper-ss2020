% Bearbeiter_A = Fabian Rod

function [A] = fd_lin_matrix(N)
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
    
    k = k1+k2*ND;
    h = (d-0)/N;  %% Schritweite
    
    %% Anpassung der Größe N + 1
    N = N+1;
    %% Vektoren
    leftVec = ones(N,1);
    rightVec = ones(N,1);
    middleVec = ones(N,1);
    
    middleInnerNodes = ((2*D+(h^2)*k)/D)*(-1);
    middleVec(:,1) = middleInnerNodes;
    middleVec(1,1) = ((1/h)+(SL/D)+(h*k)/(2*D))*(-2*h);
    middleVec(N,1) = ((1/h)+(SR/D)+(h*k)/(2*D))*(-2*h);
      
    
    %% Randbedingungen mit 2
    leftVec(N-1,1) = 2;
    rightVec(2,1) = 2;
    
    A = spdiags([leftVec middleVec rightVec], -1:1,N,N);
end