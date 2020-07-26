% Bearbeiter_A = Fabian Rod

function [z,u] = stationaer_lin(s,N)
%% Eingabe:
%   s  Funktionshandle auf Funktion s(z)
%      function sz=s(z) mit Spaltenvektoren z und sz
%   N  Anzahl von Teilintervallen N.
%%  Ausgabe:
%   z  Knotenpunkte(z0,z1,...,zN) der Größe (N+1) x 1
%   u  Vektor u der Größe (N+1) x 1
%%    
    %% Parameter [1-8]
    global P;
    d       = P(1);     
    D       = P(2);    
%     k1      = P(3);       
%     k2      = P(4);      
%     ND      = P(5);     
%     SL      = P(6);       
%     SR      = P(7);      
%     alpha   = P(8);    

    %% Berechnungen
    h = (d-0)/N;  %% Schritweite 0 steht für die Linke Grenze
    
    % z(N) = (0 + N*h);
    %z = (von Schrittweite bis);
    z = (0:h:d)'; %% Spaltenvektor z befüllen/ erstellen
    
    A = fd_lin_matrix(N); %% Komponentenmatrix erstellen
    
    %% rechte Hand Spalten Vektor b
    %b = ones(N+1,1);
    b = ((s(z).*h.^2)./D).*(-1);
    
    u = A\b;
    
end