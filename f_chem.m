%Implementation of f_chem for M2 term paper
%Author(s)			: Lukas Mirow
%Date of creation	: 7/22/2020

%A: y1' = -0.04 * y1 + 10 ^ 4 * y2 * y3
%B: y2' =  0.04 * y1 - 10 ^ 4 * y2 * y3 - 3 * 10 ^ 7 * y2 ^ 2
%C: y3' =                                 3 * 10 ^ 7 * y2 ^ 2

function dy = f_chem(t, y)
	dy1 = @(y) -0.04 * y(1) + 1e4 * y(2) * y(3);
	dy2 = @(y)  0.04 * y(1) - 1e4 * y(2) * y(3) - 3e7 * y(2) ^ 2;
	dy3 = @(y)                                    3e7 * y(2) ^ 2;
	dy = [dy1(y); dy2(y); dy3(y)];
end
