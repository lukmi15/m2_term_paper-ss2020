%Euler
%Author(s)			: Lukas Mirow
%Date of creation	: 5/12/2020

function [t, y] = euler(f, tspan, y0, n)
	h = (tspan(2) - tspan(1)) / n;
	y = y0;
	t(1) = tspan(1);
	for i = 1:n
		y(:, i + 1) = y(:, i) + h * f(t(i), y(:, i));
		t(i + 1) = tspan(1) + i * h;
	end
end
