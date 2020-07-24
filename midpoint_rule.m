#!/usr/bin/octave-cli

%Implementation of midpoint rule for M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/24/2020

function [t, y] = midpoint_rule(f, tspan, ya, n)
	h = (tspan(2) - tspan(1)) / n;
	t(1) = tspan(1);
	y = ya;
	for i = 1 : n
		k1 = f(t(i), y(:, i));
		k2 = f(t(i) + h / 2, y(:, i) + h / 2 * k1);
		y(:, i + 1) = y(:, i) + h * k2;
		t(i + 1) = t(i) + h;
	end
end
