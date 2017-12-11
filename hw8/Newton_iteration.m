function [xn,times] = Newton_iteration(x0, f, f1, f2, eps)

xn = Newton_iteration_step(x0, f, f1, f2);
times = 1;
while (abs(x0 - xn) > eps)
	x0 = xn;
	xn = Newton_iteration_step(x0, f, f1, f2);
	times = times + 1;
end

end
