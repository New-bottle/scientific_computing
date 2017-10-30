n = 20;
x = [-1:2.0/n:1];
y = 1./(1+25.*x.*x);
x0 = [-1:0.01:1];

% 第一种边界条件
f0 = (-50.0 * -1) / ((1.0 + 25)^2);
fn = (-50.0 * 1) / ((1.0 + 25)^2);
y0 = spline_interpolation(x, y, f0, fn, x0, 1);

subplot(3,1,1);
plot(x0, 1./(1+25.*x0.*x0), 'b', 'LineWidth', 4);
hold on;
plot(x0, y0, 'r', 'LineWidth', 2);

% 第二种边界条件
f0 = (3750-50.0) / (1+25)^3;
fn = (3750-50.0) / (1+25)^3;
y0 = spline_interpolation(x, y, f0, fn, x0, 2);

subplot(3,1,2);
plot(x0, 1./(1+25.*x0.*x0), 'b', 'LineWidth', 4);
hold on;
plot(x0, y0, 'r', 'LineWidth', 2);

% 第三种边界条件
f0 = -1;
fn = 1;
y0 = spline_interpolation(x, y, f0, fn, x0, 3);

subplot(3,1,3);
plot(x0, 1./(1+25.*x0.*x0), 'b', 'LineWidth', 4);
hold on;
plot(x0, y0, 'r', 'LineWidth', 2);

