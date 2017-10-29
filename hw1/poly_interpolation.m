function [y] = poly_interpolation(n)
% lagrange interpolation

x0 = [-1:2.0/n:1];
y0 = 1./(1+25.*x0.*x0);

x = [-1:0.01:1];
n = length(x0);
m = length(x);
y = zeros(m);

for i = 1:m
	s=0.0;
	z = x(i);
	for k = 1:n
		p=1.0;
		for j=1:n
			if j~=k
				p=p*(z-x0(j))/(x0(k)-x0(j));
			end
		end
		s=p*y0(k)+s;
	end
	y(i)=s;
end

plot(x,y,'r');
hold on;
plot(x,1./(1+25.*x.*x),'blue');
