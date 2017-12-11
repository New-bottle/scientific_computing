function times = Steffensen(x0, iterator, eps)

y0 = iterator(x0);
z0 = iterator(y0);
times = 0;
while (abs(z0 - x0) > eps)
	x0 = x0 - (y0-z0)^2/(z0-2*y0+x0);
	y0 = iterator(x0);
	z0 = iterator(y0);
	times = times + 1;
end
