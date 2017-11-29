
k = [1:1:1000]
h = 1./k;
n = size(h,2);
R = zeros(1,n);

for i = 1:n
	x = [0:h(i):1];
	y = sqrt(x).*log(x);
	y(1) = 0;
	Tn = h(i)*sum(y)-h(i)/2 * (y(1)+y(size(y,2)));
	R(i) = Tn+4/9;
end
plot(h, R);
