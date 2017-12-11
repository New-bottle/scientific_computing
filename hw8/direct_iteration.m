function times = direct_iteration(x0, f, phi, eps)

x0 = 1;
x1 = phi(x0);
times = 1;
while (abs(x1 - x0) > eps)
	x0 = x1;
	x1 = phi(x0);
	times = times + 1;
end
%{
times
x1
x1*x1-3*x1+2-exp(x1)
x0*x0-3*x0+2-exp(x0)

x0 = 1.35;
x1 = phi_2(x0);
times = 1;
[x0,x1]
while (abs(x1 - x0) > eps)
	x0 = x1;
	x1 = phi_2(x0);
	times = times + 1;
end
times
x1
x1*x1-3*x1+2-exp(x1)
x0*x0-3*x0+2-exp(x0)
%}
