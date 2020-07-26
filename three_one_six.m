%Solvng assignment 3.1.6 for the M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/26/2020

clc;

f = @(x, y) -y;
df = @(x, y) -1;
y0 = 1;
tspan = [0, 1];
tol = 1e-6;
nmax = Inf;
ns = 10 .^ (1:4);
sol = @(x) exp(x);

euler_errors = calc_euler_errors(f, tspan, y0, ns, df, tol, nmax, sol);
trapez_errors = calc_trapez_errors(f, tspan, y0, ns, df, tol, nmax, sol);
plot(ns, euler_errors, trapez_errors);
input("Press any key to continue");

function numerical_function_errors = calc_numerical_function_errors(f, tspan, y0, ns, df, tol, nmax, sol, numerical_function_handle)
	numerical_function_errors = zeros(size(ns));
	for i = 1:size(ns, 2)
		n = ns(i);
		[numerical_function_ts, numerical_function_sols] = numerical_function_handle(f, tspan, y0, n, df, tol, nmax);
		for j = 1:size(numerical_function_ts, 1)
			t = numerical_function_ts(j);
			err = abs(numerical_function_sols(j) - sol(t));
			if err > numerical_function_errors(i)
				numerical_function_errors(i) = err;
			end
		end
	end
end

function euler_errors = calc_euler_errors(f, tspan, y0, ns, df, tol, nmax, sol)
	euler_errors = calc_numerical_function_errors(f, tspan, y0, ns, df, tol, nmax, sol, @impl_euler);
end

function trapez_errors = calc_trapez_errors(f, tspan, y0, ns, df, tol, nmax, sol)
	trapez_errors = calc_numerical_function_errors(f, tspan, y0, ns, df, tol, nmax, sol, @impl_trapez);
end

function plot(n, euler_errors, trapez_errors)
	semilogx(n, euler_errors, "-", "DisplayName", "Euler");
	hold on
	legend show
	title("Absolute Fehler Euler und Trapez")
	xlabel("n")
	ylabel("e_abs")
	loglog(n, trapez_errors, "-", "DisplayName", "Euler");
	hold off
end
