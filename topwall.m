function [z] = topwall(x)
global a
global f2
z=100+100*((a(1)*sin(.07*f2(1)*x))) + (a(2)*sin(.09*(f2(2)*x))) + (a(3)*sin(.01*f2(3)*x)) + (a(4)*sin((.01*f2(4)*x)))+(a(5)*sin((f2(5)*x)))+(a(6)*sin((.01*f2(6)*x)))+(a(7)*sin((.01*f2(7)*x)))+(a(8)*sin((.01*f2(8)*x)))+(a(9)*sin((.01*f2(9)*x)))+(a(10)*sin((.01*f2(10)*x)));
end