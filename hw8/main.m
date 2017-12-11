eps = 1e-8;

% 方程1
x = [0:0.02:1];
n = size(x,2)
times = zeros(1,n);
time_stef = zeros(1,n);
for i = 1:n
	x0 = x(i);
	times(i) = direct_iteration(x0, @f1, @phi_1, eps);
	time_stef(i) = Steffensen(x0, @phi_1, eps);
end
%times
%time_stef

subplot(2,1,1);
plot(x, times);
hold on;
plot(x, time_stef);
legend("direct", "steffensen");

% 方程2
x = [1:0.02:3];
n = size(x,2)
times = zeros(1,n);
time_stef = zeros(1,n);
for i = 1:n
	x0 = x(i);
	times(i) = direct_iteration(x0, @f2, @phi_2, eps);
	time_stef(i) = Steffensen(x0, @phi_2, eps);
end
%times
%time_stef

subplot(2,1,2);
plot(x, times);
hold on;
plot(x, time_stef);
legend("direct", "steffensen");


function y = f1(x)
	y = x.^2-3*x+2-exp(x);
end
function Xn = phi_1(x)
	Xn = (x.*x+2-exp(x))/3;
end
function y = f2(x)
	y = x.^3+2*x.^2+10*x-20;
end
function Xn = phi_2(x)
	Xn = -2.*(x.^2.-10)./(x.^2.+10);
%	Xn = (-(2*x.*x+10*x-20)).^(1.0/3.0);
end
