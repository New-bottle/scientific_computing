x = [0.0, 0.1, 0.2, 0.3, 0.5, 0.8, 1.0];
y = [1.0 0.41, 0.50, 0.61, 0.91, 2.02, 2.46];
x0 = [-0.1:0.01:1.1];

plot(x, y, '.', 'MarkerSize', 20);
hold on;

y0 = polyfitn(x, y, x0, 3);
plot(x0, y0);
hold on;
y0 = polyfitn(x, y, x0, 4);
plot(x0, y0);
hold on;

legend("数据点","三次多项式插值曲线","四次多项式插值曲线");
