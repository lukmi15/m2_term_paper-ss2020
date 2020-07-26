% Bearbeiter_A = Fabian Rod

function [z,u] = stationaer_nonlin(s,N,tol,nmax)
%% Eingabe:
%   s     Funktionshandle auf Funktion s(z)
%         function sz=s(z) mit Spaltenvektoren z und sz
%   N     Anzahl von Teilintervallen N.
%   tol   Toleranz für Newton-Verfahren
%   nmax  maximale Anzahl an Schritten des Newton-Verfahrens
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
        
    %% rechte Hand Spalten Vektor b
    %b = ones(N+1,1);
    b = ((s(z).*h.^2)./D).*(-1);
    
    
    % newton aufrufen
    
    %% Newton-Verfahren für nichtlineare Gleichungssysteme 
    u0 = zeros(N+1,1);

    u = zeros(length(u0),nmax);
    u(:,1)= u0(:);
     
    %% [fx,Jx] = feval(f,u(:,1));
    Fu = fd_nonlin(u(:,1),N)-b;
    Ju = fd_nonlin_jac(u(:,1),N);

    %%u(:,2) = u0 - Ju\Fu;
    u(:,2) = u0 - Ju\(Fu);
  
    for k=2:nmax+1
        Fu = fd_nonlin(u(:,k),N)-b;
        Ju = fd_nonlin_jac(u(:,k),N);
        
        if (norm(Fu)+norm(u(:,k)-u(:,k-1)) < tol)
            u=u(:,k);
            return
        end
        u(:,k+1) = u(:,k) - Ju\(Fu);
    end
    u=u(:,nmax+1);    
end