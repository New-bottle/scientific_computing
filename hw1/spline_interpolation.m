function [] = spline_interpolation(n)

x0 = [-1:2.0/n:1];
y0 = 1./(1+25.*x0.*x0);

x = [-1:0.01:1];
n = length(x0); m = length(x);
y = zeros(m);
m0 = (-50.*x0)./((1+25.*x0.*x0).^2);

for t = 1:m
	z=x(t);
	for k=1:n
		if z<=x0(k+1) 
			alpha_k = (1+2*(z-x0(k))/(x0(k+1)-x0(k)))*(((z-x0(k+1))/(x0(k)-x0(k+1)))^2);
			alpha_k1 = (1+2*(z-x0(k+1))/(x0(k)-x0(k+1)))*(((z-x0(k))/(x0(k+1)-x0(k)))^2);
			beta_k = (z-x0(k))*(((z-x0(k+1))/(x0(k)-x0(k+1)))^2);
			beta_k1 = (z-x0(k+1))*(((z-x0(k))/(x0(k+1)-x0(k)))^2);
			y(t) = alpha_k * y0(k) + (alpha_k1 * y0(k+1)) + beta_k * m0(k) + beta_k1 * m0(k+1);
			break;
		end
	end
end

plot(x, y, 'r');
hold on;
plot(x, 1./(1+25.*x.*x), 'b');
