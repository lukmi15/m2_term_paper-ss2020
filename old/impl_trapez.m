%Implicit euler implementation for M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/9/2020

function [t, y] = impl_trapez(f, tspan, ya, n, df, tol, nmax)
	h = (tspan(2) - tspan(1)) / n;
	y = ya';
	x0 = zeros(size(ya, 1), 1);
	t(1) = tspan(1);
	for i = 1:n
		[z, ~, ~] = newton(@(z) F_trapez(z, t(i), h, y(i, :)', f, df), x0, tol, nmax);
		y(i + 1, :) = y(i, :) + z';
		t(i + 1, 1) = tspan(1) + h;
	end
end
