%Implementation of f_chem_jac for M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/22/2020

%A: J1' = [-0.04,                    10 ^ 4 * y3,  10 ^ 4 * y2]
%B: J2' = [ 0.04, -6 * 10 ^ 7 * y2 - 10 ^ 4 * y3, -10 ^ 4 * y2]
%C: J3' = [ 0   ,  6 * 10 ^ 7 * y2              ,   0         ]

function J = f_chem_jac(t, y)
	j1 = @(t, y) [-.04,               1e4 * y(3),  1e4 * y(2)];
	j2 = @(t, y) [ .04, -6e7 * y(2) - 1e4 * y(3), -1e4 * y(2)];
	j3 = @(t, y) [   0,  6e7 * y(2)             ,  0         ];
	J = [j1(t, y); j2(t, y); j3(t, y)];
end
