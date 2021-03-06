function y0 = spline_interpolation(x, y, f0, fn, x0, kind)

n = length(x); m = length(x0);
y0 = zeros(m,1);

% 中间变量定义
miu = zeros(n);
lambda = zeros(n);
d = zeros(n);
h = zeros(n);

% 中间变量计算
for i = 1:n-1
	h(i) = x(i+1) - x(i);
end
for i = 2:n-1
	miu(i) = h(i-1)/(h(i-1)+h(i));
	lambda(i) = h(i)/(h(i-1)+h(i));
	d(i) = 6*( (y(i+1)-y(i))/(x(i+1)-x(i))-(y(i)-y(i-1))/(x(i)-x(i-1)) ) / (h(i-1)+h(i));
end
% 三种不同的边界条件
if kind == 1
	lambda(1) = 1;
	miu(n) = 1;
	d(1) = 6/h(1)*((y(2)-y(1))/(x(2)-x(1))-f0);
	d(n) = 6/h(n-1)*(fn-(y(n-1)-y(n))/(x(n-1)-x(n)));
end
if kind == 2
	lambda(1) = 0;
	miu(1) = 0;
	d(1) = 2*f0;
	d(n) = 2*fn;
end
if kind == 3
	lambda(1) = 0;
	miu(1) = 0;
	lambda(n) = h(1) / (h(1) + h(n-1));
	miu(n) = 1-lambda(n);
	d(1) = 0;
	d(n) = 6*((y(2)-y(1))/(x(2)-x(1))-(y(n)-y(n-1))/(x(n)-x(n-1)))/(h(1)+h(n-1));
end

% 列出方程
A = zeros(n,n);
for i = 1:n
	A(i,i) = 2;
	if (i>1)
		A(i,i-1) = miu(i);
	end
	if (i<n)
		A(i,i+1) = lambda(i);
	end
end

if kind == 3
	A(2,n) = miu(2);
	A(n,2) = lambda(n);
end

% 解方程
M = A\d;
if kind == 3
	M(1) = M(n);
end

% 计算在给定点的插值函数值
for i = 1:m
	z = x0(i);
	for j = 1:(n-1)
		if z<=x(j+1)
			y0(i) = M(j)*((x(j+1)-z)^3)/6/h(j)+...
			        M(j+1)*((z-x(j))^3)/6/h(j)+...
			        (y(j)-M(j)*(h(j)^2)/6)*(x(j+1)-z)/h(j)+...
					(y(j+1)-(M(j+1)*h(j)^2)/6)*(z-x(j))/h(j);
			break;
		end
	end
end

