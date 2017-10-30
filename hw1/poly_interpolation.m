function [y0] = poly_interpolation(x, y, x0)
% lagrange interpolation

n = length(x);
m = length(x0);
y0 = zeros(m,1);

for i = 1:m
	s=0.0;
	z = x0(i);
	for k = 1:n
		p=1.0;
		for j=1:n
			if j~=k
				p=p*(z-x(j))/(x(k)-x(j));
			end
		end
		s=p*y(k)+s;
	end
	y0(i)=s;
end

