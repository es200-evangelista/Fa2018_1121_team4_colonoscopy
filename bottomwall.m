function [y] = bottomwall(x)
global a
global f
y=-10+10*((a(1)*sin(.07*f(1)*x))) + (a(2)*sin(.09*(f(2)*x))) + (a(3)*sin(.01*f(3)*x)) + (a(4)*sin((.01*f(4)*x)))+(a(5)*sin((f(5)*x)))+(a(6)*sin((.01*f(6)*x)))+(a(7)*sin((.01*f(7)*x)))+(a(8)*sin((.01*f(8)*x)))+(a(9)*sin((.01*f(9)*x)))+(a(10)*sin((.01*f(10)*x)));
end