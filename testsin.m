clear all
fig = figure(1);
ax = axes(fig);
ax.XLim = [0 300];
ax.YLim = [-20 20];
hold on
x = linspace(0,3000,300000);
a = rand(1,10)
f = rand(1,10)
f2 = rand(1,10)
y=10*((a(1)*sin(.07*f(1)*x))) + (a(2)*sin(.09*(f(2)*x))) + (a(3)*sin(.01*f(3)*x)) + (a(4)*sin((.01*f(4)*x)))+(a(5)*sin((f(5)*x)))+(a(6)*sin((.01*f(6)*x)))+(a(7)*sin((.01*f(7)*x)))+(a(8)*sin((.01*f(8)*x)))+(a(9)*sin((.01*f(9)*x)))+(a(10)*sin((.01*f(10)*x)));
plot(x,y);

while(1)
    ax.XLim=ax.XLim+.1;
    pause(.01)
end