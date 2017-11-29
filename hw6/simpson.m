function T = simpson(l, r)
l = l + 1e-20;
x = [l, (l+r)/2, r];
y = sqrt(x).*log(x);
T = (r-l)/6*(y(1) + 4*y(2) + y(3));
