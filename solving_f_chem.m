#!/usr/bin/octave-cli

%Solving f_chem for the M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/24/2020

clc;

tol = 1e-6;
n = 1e3; %TODO: Experiment to find a value where the tolerance is less than `tol`!
tspan = [0, 100];
y0 = [0; 0; 0];

sol_expl_euler = euler(@f_chem, tspan, y0, n);
sol_midpoint_rule = midpoint_rule(@f_chem, tspan, y0, n);
assert(all(abs(sol_expl_euler - sol_midpoint_rule) < tol));

% sol_impl_euler = ; %TODO
% assert(all(abs(sol_midpoint_rule - sol_impl_euler) < tol));
% sol_impl_trape = ; %TODO
% assert(all(abs(sol_impl_euler - sol_impl_trape) < tol));
