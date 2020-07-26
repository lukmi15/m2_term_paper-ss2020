% Bearbeiter_A = Fabian Rod

function [sz] = s3(z)
    %% Parameter [1-8]
    global P;
%     d       = P(1);     
%     D       = P(2);    
%     k1      = P(3);       
%     k2      = P(4);      
%     ND      = P(5);     
%     SL      = P(6);       
%     SR      = P(7);      
    alpha   = P(8); 
    %% 
    S0 = 1e+3;
    sz = S0.*exp((alpha.*z).*(-1));
end

