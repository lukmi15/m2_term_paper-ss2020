#!/usr/bin/octave-cli

%F_trapez implementation for M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/9/2020

clc;

function [F, J] = F_trapez(z, ti, h, yi, f, df) %TODO: does t_{i+1} equal ti + 1?
	F = h / 2 * (f(ti, yi) + f(ti + 1, yi + z)) - z;
	J = h / 2 * df(ti + 1, yi + z) - eye(size(z, 1));
	J = sparse(J);
end
