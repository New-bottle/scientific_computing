function T = Simpson(n)

h = 1.0/n;
x = [0:h:1];
y = sqrt(x).*log(x);
y(1) = 0;

T = 0;
for j = 1:n
	xm = (x(j) + x(j+1))/2;
	T = T + h/6*(y(j)+4*sqrt(xm)*log(xm)+y(j+1));
end
