k = [1:1:1000];
h = 1./k;
n = size(h,2);
R = zeros(1,n);

subplot(3,1,1);
for i = 1:n
	R(i) = Trapezoidal(i)+4/9;
end
plot(h, R);
title("复化梯形求积h-R");
xlabel("h");
ylabel("R");

subplot(3,1,2);
for i = 1:n
	R(i) = Simpson(i) + 4/9;
end
plot(h, R);
title("复化辛普森求积h-R");
xlabel("h");
ylabel("R");

subplot(3,1,3);
n = 15;
h = ones(1, n);
R = ones(1, n);
for i = 2:n
	h(i) = h(i-1)/2;
	R(i) = Romberg(i)+4/9;
end
plot(h, R);
title("Romberg求积方法h-R");
xlabel("h");
ylabel("R");
