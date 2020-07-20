#!/usr/bin/octave-cli

%Implicit euler implementation for M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/9/2020

function [t, y] = impl_euler(f, tspan, ya, n, df, tol, nmax)
	k = size(ya, 1);
	y = zeros(n + 1, k);
	t = zeros(n + 1, 1);
	h = (tspan(2) - tspan(1)) / n;
	y(1, :) = ya';
	t(1) = tspan(1);
	for i = 1:n
		[z, ~, ~] = newton(@(z) F_euler(z, t(i), h, y(i, :), f, df), y(i, :), tol, nmax);
		y(i + 1, :) = y(i, :) + z;
		t(i + 1, :) = tspan(1) + h;
	end
end

% function [t, y] = impl_euler(f, tspan, ya, n, df, tol, nmax)
% 	t = zeros(n + 1, 1);
% 	y = zeros(n, + 1 1);

% 	t(1) = tspan(1);
% 	y(1) = ya;
% 	z_init = 0;
% 	h = (tspan(2) - tspan(1)) / n;

% 	for i = 1:n
% 		t(i + 1) = t(i) + h;
% 		[t, tmp] = newton_skalar(@(z)F_euler(z_init, t(k), h, y(i), f, df), y(i), tol, nmax);
% 		y(i + 1) = y(i) + (h * f(t(i+1), y(i) + z));
% 	end
% end
