function [xn,times] = Steffensen(x0, iterator, eps)

y0 = iterator(x0);
z0 = iterator(y0);
if (z0-2*y0+x0) == 0
	xn = x0;
	times = 0;
	return;
end
xn = x0 - ((y0-x0).^2)/(z0-2*y0+x0);
times = 1;
while (abs(xn - x0) > eps)
	x0 = xn;
	y0 = iterator(x0);
	z0 = iterator(y0);
	if (z0-2*y0+x0) == 0
		return;
	end
	xn = x0 - (y0-x0)^2/(z0-2*y0+x0);
	times = times + 1;
end
