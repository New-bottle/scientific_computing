k = [1:1:1000];
h = 1./k;
n = size(h,2);
R = zeros(1,n);

for i = 1:n
	x = [0:h(i):1];
	y = sqrt(x).*log(x);
	y(1) = 0;
	Tn = 0;
	for j = 1:k(i)
		xm = (x(j) + x(j+1))/2;
		Tn = Tn + h(i)/6*(y(j)+4*sqrt(xm)*log(xm)+y(j+1));
	end
%	Tn = h(i)*sum(y)-h(i)/2 * (y(1)+y(size(y,2)));
	R(i) = Tn+4/9;
end
plot(h, R);
