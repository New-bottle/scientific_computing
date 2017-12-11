x = [1:10];
p = poly(x);
test(p, 1e-6)
test(p, 1e-8)
test(p, 1e-10)

function test(p, eps)
	p(2) = p(2) + eps;
	roots(p)
end
