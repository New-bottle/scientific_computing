eps = 1e-8;

% 方程1
x = [0:0.01:2];
n = size(x,2);
times = zeros(1,n);
time_stef = zeros(1,n);
for i = 1:n
	x0 = x(i);
	[xn,times(i)] = direct_iteration(x0, @f1, @phi_1, eps);
	[xn,time_stef(i)] = Steffensen(x0, @phi_1, eps);
end

subplot(3,1,1);
plot(x, times);
hold on;
plot(x, time_stef);
ylabel("迭代次数");
legend("direct", "steffensen");

% 方程2
x = [0:0.01:3];
n = size(x,2);
times = zeros(1,n);
time_stef = zeros(1,n);
for i = 1:n
	x0 = x(i);
	[xn,times(i)] = direct_iteration(x0, @f2, @phi_2, eps);
	[xn,time_stef(i)] = Steffensen(x0, @phi_2, eps);
end
%times
%time_stef

subplot(3,1,2);
plot(x, times);
hold on;
plot(x, time_stef);
ylabel("迭代次数");
legend("direct", "steffensen");

%------------------------- Newton --------------------------%

for i = 1:n
	x0 = x(i);
	[xn,time_stef(i)] = Steffensen(x0, @phi_2, eps);
	[xn, times_newton(i)] = Newton_iteration(x0, @f2, @df2, @ddf2, eps);
end
subplot(3,1,3);
hold on;
plot(x, times_newton);
plot(x, time_stef);
ylabel("迭代次数");
legend("Newton", "steffensen");

% --------------------------------------------------------- %
function y = f1(x)
	y = x.^2-3*x+2-exp(x);
end
function Xn = phi_1(x)
	Xn = (x.*x+2-exp(x))/3;
%	Xn = log(x.^2-3*x+2);
end
function y = f2(x)
	y = x.^3+2*x.^2+10*x-20;
end
function Xn = phi_2(x)
	Xn = -2.*(x.^2.-10)./(x.^2.+10);
%	Xn = (-(2*x.*x+10*x-20)).^(1.0/3.0);
end
function y = df2(x)
	y = 3*x.^2+4*x+10;
end
function y = ddf2(x)
	y = 6*x+4;
end
