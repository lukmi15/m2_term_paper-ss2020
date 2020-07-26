%F_euler implementation for M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/3/2020

function [F, J] = F_euler(z, ti, h, yi, f, df)
	F = h * f(ti, yi + z) - z;
	J = h * df(ti + h, yi + z) - eye(size(z, 1));
	J = sparse(J);
end
