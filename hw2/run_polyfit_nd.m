x = [0.0, 0.1, 0.2, 0.3, 0.5, 0.8, 1.0];
y = [1.0 0.41, 0.50, 0.61, 0.91, 2.02, 2.46];
x0 = [0:0.01:1];

m = length(x);

v = 1;
% features
f1 = 1./(x+v);
f2 = x;
bias = ones(1,m);
X = [f1', f2', bias'];

theta = pinv(X'*X)*X'*y';
X0 = [(1./(x0+v))', x0', ones(1,length(x0))'];
y0 = X0*theta;

plot(x, y, '.', 'MarkerSize', 20);
hold on;
plot(x0, y0);

