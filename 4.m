%Solving assignment 4
%Author(s)			: Lukas Mirow
%Date of creation	: 7/26/2020

clc;

tol = 1e-6;
n = 10; %TODO: Experiment to find a value where the tolerance is less than `tol`!
tspan = [-0.05, 0.2];
y0 = [.1; .5; 0];
nmax = 100;

S0 = 1e4;
% S0 = 1e5;
% S0 = 1e6;

function ret = s(t, z)
	ret = S0 * e ^ (-t ^ 2 / 2 / 0.01 ^ 2) * e ^ (-alpha * z);
end

function [fval, J] = f_wrapper(t, y)
	fval = fd_nonlintime(t, y);
	J = fd_nonlintime_jac(t, y);
end

[sol_steps, sol_values] = impl_trapez(@f_wrapper, tspan, y0, n, @fd_nonlintime_jac, tol, nmax)
