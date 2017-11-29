function T = Romberg(n)

T = zeros(1,n);
t = zeros(n,n);
% 梯形可以用递推的方式计算，此处为了方便直接调用了第一问写好的函数
% 即t[k][1] = t[k-1][1]/2 + 1/2*sum(区间中点处函数值)
for k = 1:n
	t(k,1) = Trapezoidal(2^(k-1));
end
for k = 1:n
	for m = 2:k
		t(k,m) = (4^(m-1))/(4^(m-1)-1)*t(k, m-1) - 1/(4^(m-1)-1)*t(k-1, m-1);
	end
end
T = t(n,n);
