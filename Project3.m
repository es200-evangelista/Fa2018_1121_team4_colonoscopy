%% Make Graph
fig = figure(1);
ax = axes(fig);
ax.XLim = [0 300];
ax.YLim = [-200 200]; 
hold on
%% Make Walls
%variables fo walls
global a; %% declares amplitude global variable
global f; % frequency
global f2; % frequency

% wall equations
x = linspace(0,3000,300000); % all of the x values for the whole game
a = rand(1,10);
f = rand(1,10); %randomizes frequency arrays
f2 = rand(1,10); %same thing
y=-100+100*((a(1)*sin(.07*f(1)*x))) + (a(2)*sin(.09*(f(2)*x))) + (a(3)*sin(.01*f(3)*x)) + (a(4)*sin((.01*f(4)*x)))+(a(5)*sin((f(5)*x)))+(a(6)*sin((.01*f(6)*x)))+(a(7)*sin((.01*f(7)*x)))+(a(8)*sin((.01*f(8)*x)))+(a(9)*sin((.01*f(9)*x)))+(a(10)*sin((.01*f(10)*x)));
z=100+100*((a(1)*sin(.07*f2(1)*x))) + (a(2)*sin(.09*(f2(2)*x))) + (a(3)*sin(.01*f2(3)*x)) + (a(4)*sin((.01*f2(4)*x)))+(a(5)*sin((f2(5)*x)))+(a(6)*sin((.01*f2(6)*x)))+(a(7)*sin((.01*f2(7)*x)))+(a(8)*sin((.01*f2(8)*x)))+(a(9)*sin((.01*f2(9)*x)))+(a(10)*sin((.01*f2(10)*x)));

%plotting
plot(x,y)
hold on
plot(x,z)
set(gca,'color',[1,.4,.4]); %color for background 
hold on
%% Make Object
w=[0 20 20 0 0];
h=[0 0 20 20 0];
h= fill(w,h,'g'); %object fills as green

%% Make Vector
vectorx=[20 40];
vectory=[0 0];
vector=plot(vectorx,vectory);
vector.UserData.l = 40; 
vector.UserData.theta = 0;
vector.XData = vector.XData+mean(h.XData);
vector.YData = vector.YData+mean(h.YData); 

%% Make Lasers

laserx=[20 30 30 20 20];
lasery=[0 0 10 10 0];
laser = plot(laserx, lasery, 'o');
laser.UserData.l=2;
laser.Visible = 'off';
laser.UserData.v = 8;
laser.UserData.vx = 0;
laser.UserData.vy = 0;
laser.UserData.dead=0;

%% Add bad guys
%% random enemies 
badguyok = 0;
i=1;
hbadguys = [];
    while (i<=10)
  b = randi(3000,1)
  c = randi(301,1)-150
  hbadguy = fill([b,b,b+20,b+20,b],[c,c+20,c+20,c,c],'g')
  pause(0.01); 
   if (topwallcollision(hbadguy) || bottomwallcollision(hbadguy))
      disp('bad badguy - make a new one');
      badguyok = 0;
      %clear hbadguy
      delete([hbadguy]);
      pause(0.01); 
   else 
      disp('good badguy'); 
      badguyok = 1;
      hbadguys=[hbadguys hbadguy]; 
      i = i+1
  end 
    end
  
%% Plot Motion
flushinput(s);
v=1;
while(1)
    %% scanning screen and object forward
    h.XData = h.XData+1; % Moves object left to right
    vector.XData = vector.XData+1; 
    ax.XLim = ax.XLim+v; % Plans the screen along with object
    
    %% reading in joystick input
    dat = fscanf(s);
    %Parsing the $JOYSTK,FFFF,512,512,512,512*33 into actual numbers
    [nochksum,chksum] = strread(dat,'%s%d','delimiter','*');
    [hdr,btnstr,jlx,jly,jrx,jry] = strread(nochksum{1},'%s%s%d%d%d%d','delimiter',',');
    input=hex2dec(btnstr); %% turns intput into a hex
    joystickleftx = jrx-521;
    joysticklefty = jry-529;
    %% rotate the laser guideline
    vector.UserData.theta = atan2(joysticklefty,joystickleftx); 
    % steal lines 106 and 107 from MIDN Lawrence
    vector.set(...
        'XData',[mean(h.XData) mean(h.XData)+vector.UserData.l*cos(vector.UserData.theta)],...
        'YData',[mean(h.YData) mean(h.YData)+vector.UserData.l*sin(vector.UserData.theta)]);
    if (jrx == 521) && (jry>=514 && jry<=516) %make guideline visible if pressed
        vector.Visible='off';
    else
        vector.Visible='on';
    end
    
    for j=1:10
        if (isCollision2(laser,hbadguys(j)))
            fprintf('Hit!')
        end
    end
    
%     if (badguycollision(laser)==1)
%         fprintf('collison');
%     end
    %% fire laser
    if input == 65527 % bug somewhere in this section
        fprintf('shoot\n');
        laser.XData = [0 2 2 0 0] + mean(h.XData);
        laser.YData = [0 0 2 2 0] + mean(h.YData);
        laser.UserData.vx = laser.UserData.v*cos(vector.UserData.theta);
        laser.UserData.vy = laser.UserData.v*sin(vector.UserData.theta);
        laser.Visible= 'on';
        laser.UserData.dead = 1;
    end
    
    if (laser.UserData.dead == 1)
            laser.XData = laser.XData + laser.UserData.vx;
            laser.YData = laser.YData + laser.UserData.vy;
            if mean(laser.XData) > mean(h.XData) + 200
                laser.UserData.dead = 0;
                laser.Visible='off';
            end
            if (bottomwallcollision(laser))==1 || (topwallcollision(laser)==1)
                laser.UserData.dead = 0;
                laser.Visible = 'off';
            end
            
        end
    
    %% moving object
    if ((input == 63487) && (topwallcollision(h) == 0)) % press up to go up
        h.YData=h.YData+1;
        vector.YData = vector.YData+10;
    end
    if ((input == 65023) && (bottomwallcollision(h)==0)) % press down to go down
        h.YData=h.YData-1;
        vector.YData = vector.YData - 10;
    end
    
    %% moving object if colliding with wall
    if (bottomwallcollision(h))==1 % Detects collision with bottom wall and pushes us up
        
        h.YData=h.YData+.5;
        vector.YData = vector.YData + 5; 
    end
    if (topwallcollision(h))==1 % detects collision with top wall and pushes us down
        
        h.YData=h.YData-.5;
        vector.YData = vector.YData-5; 
    end
    pause(.001);
    end