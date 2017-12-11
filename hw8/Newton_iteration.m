function times = Newton_iteration(x0, f, f1, f2, eps)

x1 = Newton_iteration_step(x0, f, f1, f2);
times = 1;
while (abs(x0 - x1) > eps)
	x0 = x1;
	x1 = Newton_iteration_step(x0, f, f1, f2);
	times = times + 1;
end

end
