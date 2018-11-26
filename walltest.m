fig = figure(1);
axis([0 300 -20 20]);
hold on
f=rand(12,1)
f2 = rand(12,1)
y=0
z=0
for i = 1:12
    yi = sin(f(i)*x)
    zi = sin(f2(i)*x)
    y=y+yi;
    z+z+zi;
end
a=y-10
b=z+10
v = 0;
x = linspace(0,300);
plot(x,a)
plot(x,b)
hold on
