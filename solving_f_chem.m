%Solving f_chem for the M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/24/2020

clc;

tol = 1e-6;
n = 10; %TODO: Experiment to find a value where the tolerance is less than `tol`!
tspan = [0, 100];
y0 = [15; 15; 225];
nmax = 100;

[sol_expl_euler_steps, sol_expl_euler_values] = euler(@f_chem, tspan, y0, n);
[sol_midpoint_rule_steps, sol_midpoint_rule_values] = midpoint_rule(@f_chem, tspan, y0, n);
sol_expl_euler_values
sol_midpoint_rule_values
exit
assert(all(sol_expl_euler_steps == sol_midpoint_rule_steps));
assert(all(abs(sol_expl_euler_values - sol_midpoint_rule_values) < tol));

function [fval, J] = impl_something_f(t, y)
	fval = f_chem(t, y);
	J = f_chem_jac(t, y);
end

[sol_impl_euler_steps, sol_impl_euler_values] = impl_euler(@impl_something_f, tspan, y0, n, @f_chem_jac, tol, nmax)
[sol_impl_trape_steps, sol_impl_trape_values] = impl_trapez(@impl_something_f, tspan, y0, n, @f_chem_jac, tol, nmax)
assert(all(sol_impl_euler_values == sol_impl_trape_steps));
assert(all(abs(sol_impl_euler_values - sol_impl_trape_values) < tol));
printf('Done! \\(")/\n');
