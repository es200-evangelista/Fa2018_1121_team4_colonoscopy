%% Make Graph
fig = figure(1);
ax = axes(fig);
ax.XLim = [0 300];
ax.YLim = [-20 20];
%axis([0 300 -20 20]);
hold on
v = 0;
global a;
global f;
global f2;
x = linspace(0,3000,300000);
a = rand(1,10);
f = rand(1,10);
f2 = rand(1,10);
y=-10+10*((a(1)*sin(.07*f(1)*x))) + (a(2)*sin(.09*(f(2)*x))) + (a(3)*sin(.01*f(3)*x)) + (a(4)*sin((.01*f(4)*x)))+(a(5)*sin((f(5)*x)))+(a(6)*sin((.01*f(6)*x)))+(a(7)*sin((.01*f(7)*x)))+(a(8)*sin((.01*f(8)*x)))+(a(9)*sin((.01*f(9)*x)))+(a(10)*sin((.01*f(10)*x)));
z=10+10*((a(1)*sin(.07*f2(1)*x))) + (a(2)*sin(.09*(f2(2)*x))) + (a(3)*sin(.01*f2(3)*x)) + (a(4)*sin((.01*f2(4)*x)))+(a(5)*sin((f2(5)*x)))+(a(6)*sin((.01*f2(6)*x)))+(a(7)*sin((.01*f2(7)*x)))+(a(8)*sin((.01*f2(8)*x)))+(a(9)*sin((.01*f2(9)*x)))+(a(10)*sin((.01*f2(10)*x)));
plot(x,y)
hold on
plot(x,z)
set(gca,'color',[1,.4,.4]);
hold on
%% Make Object
w=[0 20 20 0 0];
h=[0 0 2 2 0];
h= fill(w,h,'g');
%% Plot Motion
flushinput(s)
v=1;
while(1)
    h.XData = h.XData+1;
%%Initialize Joystick
    dat = fscanf(s);
    %Parsing the $JOYSTK,FFFF,512,512,512,512*33 into actual numbers
    [nochksum,chksum] = strread(dat,'%s%d','delimiter','*');
    [hdr,btnstr,jlx,jly,jrx,jry] = strread(nochksum{1},'%s%s%d%d%d%d','delimiter',',');
    input=hex2dec(btnstr);
    if ((input == 63487) && (topwallcollision(h) == 0))
        h.YData=h.YData+1;
    end
    if ((input == 65023) && (bottomwallcollision(h)==0))
        h.YData=h.YData-1;
    end
    if (bottomwallcollision(h))==1
        fprintf('bottomwall\n')
        h.YData=h.YData+.5
    end
    if (topwallcollision(h))==1
        fprintf('topwall\n')
        h.YData=h.YData-.5
    end
    ax.XLim = ax.XLim+v;
    pause(.001);
    end