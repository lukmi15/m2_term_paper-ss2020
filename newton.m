% Newton-Verfahren für nichtlineare Gleichungssysteme
%
%   [x, fval, exitflag] = newton(f, x0, tol, nmax)
%
% Beim Newton-Verfahren soll mindestens ein Schritt durchgeführt werden
% und die Iteration abgebrochen werden, falls für die k-te Iterierte x_k
%
%	|| f(x_k) || + || x_k - x_(k-1) || < tol
%
% gilt. Hier ist ||.|| die (euklidsche) Länge eines Vektors. Rückgabewert
% ist dann x_k ansonsten x_nmax.
%
% Eingabe:
%   f        Funktionshandle auf Funktionshandle [y,dy] = f(x)
%				Eingabe:
%					x	Spaltenvektor der Unbekannten
%				Ausgabe:
%					y	Spaltenvektor des Funktionswertes an x
%					dy	Jacobi-Matrix an x
%	x0		 Spaltenvektor des Startwerts x_0
%	tol	 Toleranz
%	nmax	 maximale Anzahl an Iterationen bis Abbruch
%
% Ausgabe
%	x		 Spaltenvektor der näherungsweisen Nullstelle
%	fval	 Spaltenvektor des Funktionswertes an x
%	exitflag Rückgabewert 1 falls Iteration Toleranzbedingung erfüllt hat
%            ansonsten 0
%

%Solving f_chem for the M2 term paper
%Author(s)			: Lukas Mirow

function [x, fval, exitflag] = newton(f, x0, tol, nmax)
	exitflag = 0; %Not needed
	x = x0;
	k = 1;
	[fval, J] = f(x(:, k));
	k = k + 1;
	x(:, k) = x(:, k - 1) - J \ fval;
	while k <= nmax && norm(fval) + norm(x(:, k) - x(:, k - 1)) >= tol
		[fval, J] = f(x(:, k));
		k = k + 1;
		x(:, k) = x(:, k - 1) - J \ fval;
	end
	x = x(:, end);
	[fval, ~] = f(x);
end
