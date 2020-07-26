% Bearbeiter_A = Fabian Rod

global P; 
P = ones(8,1);

%% Parameter [1-8]
d       = 3;                %µm
D       = 2;                %µm^2/µs
k1      = 4;                %1/µs
k2      = 2;                %µm^3/µs
ND      = 0;                %1/µm^3
SL      = 4/5;              %µm/µs
SR      = -271/104;         %µm/µs
alpha   = 10;               %µm

P(1,1) = d;
P(2,1) = D;
P(3,1) = k1;
P(4,1) = k2;
P(5,1) = ND;
P(6,1) = SL;
P(7,1) = SR;
P(8,1) = alpha;  

%% Berechnungen

z = (0:0.001:d)';
uz = u(z); 

legendCell = strcat('N=',string(num2cell(0:10:100)));
legendCell(1,1) = 'u = 5.*z.^4+2.*z+5';
 
plot(z,uz,'g');
title('Test der Funktion: Stationär Linear');


hold on;

for N=10:10:100
    [zN,uN] = stationaer_nonlin(@s_test_lin,N,1e-8,15);
    plot(zN,uN,'MarkerIndices',[1 2 3]);
end;

legend(legendCell,'Location','southwest');
hold off;



%% Benötigte Funktionen
function uz = u(z)
    uz = 5.*z.^4+2.*z+5;
end

function [sz] = s_test_lin(z)
    sz = 50.*z.^8+40.*z.^5+120.*z.^4-112.*z.^2+48.*z+70;
end

