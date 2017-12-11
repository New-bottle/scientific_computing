function T = AdaptSimpson(l, r, eps)
disp([l,r]);
mid = (l + r) / 2;
v = simpson(l, r);
vl = simpson(l, mid);
vr = simpson(mid, r);
if (abs(v-vl-vr) < eps) T = v;
else T = AdaptSimpson(l, mid, eps) + AdaptSimpson(mid, r, eps);
end

