x = [0.0, 0.1, 0.2, 0.3, 0.5, 0.8, 1.0];
y = [1.0 0.41, 0.50, 0.61, 0.91, 2.02, 2.46];
x0 = [-0.1:0.01:1.1];

plot(x, y, '.');
hold on;
X = vander(x);
X3 = X(:,[5:7]);
X4 = X(:,[4:7]);
X6 = X(:,[1:7]);

X = X3;
theta = pinv(X'*X)*X'*y';
plot(x0, polyval(theta, x0));
hold on;
X = X4;
theta = pinv(X'*X)*X'*y';
plot(x0, polyval(theta, x0));
hold on;
X = X6;
theta = pinv(X'*X)*X'*y';
plot(x0, polyval(theta, x0));

legend("数据点","三次多项式插值曲线","四次多项式插值曲线");
