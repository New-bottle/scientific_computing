function y0 = polyfitn(x, y, x0, n)

m = length(x);
tmp = vander(x);
X = tmp(:,[m-n:m]);
theta = pinv(X'*X)*X'*y';
y0 = polyval(theta, x0);
