%Implicit euler implementation for M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/9/2020

function [t, y] = impl_euler(f, tspan, ya, n, df, tol, nmax)
	h = (tspan(2) - tspan(1)) / n;
	y = ya';
	size(ya)
	x0 = zeros(size(ya), 1);
	t(1) = tspan(1);
	for i = 1:n
		[z, ~, ~] = newton(@(z) F_euler(z, t(i), h, y(1, :)', f, df), x0, tol, nmax);
		y(i + 1, :) = y(i, :) + z';
		t(i + 1, 1) = tspan(1) + h;
	end
end
