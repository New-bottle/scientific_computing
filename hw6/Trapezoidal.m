function T = Trapezoidal(n)

h = 1.0 / n;
x = [0:h:1];
y = sqrt(x).*log(x);
%y = x.^(3/2);
y(1) = 0;

T = h * sum(y) - h/2*(y(1)+y(n+1));
