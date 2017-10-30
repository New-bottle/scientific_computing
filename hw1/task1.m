
n = 20;

% 生成插值点
x = [-1:2.0/n:1];
y = 1./(1+25.*x.*x);
x0 = [-1:0.01:1];

% 多项式插值
y0 = poly_interpolation(x, y, x0);

subplot(2,1,1);
plot(x0, 1./(1+25.*x0.*x0), 'b', 'LineWidth', 4);
hold on;
plot(x0, y0, 'r', 'LineWidth', 2);
legend('原函数','多项式插值函数');

% 三次样条插值
f0 = (-50.0 * -1) / ((1.0 + 25)^2);
fn = (-50.0 * 1) / ((1.0 + 25)^2);
y0 = spline_interpolation(x, y, f0, fn, x0, 1);

subplot(2,1,2);
plot(x0, 1./(1+25.*x0.*x0), 'b', 'LineWidth', 4);
hold on;
plot(x0, y0, 'r', 'LineWidth', 2);
legend('原函数','多项式插值函数');
