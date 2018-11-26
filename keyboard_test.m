% keyboard_test.m
% example keyboard loop for ES200 game
% D Evangelista 2018
% Uses Prof Broussard's KeyboardEmulator class

% create world
close all
fig = figure(1);
ax = axes(fig)
ax.XLim = [-10 10];
ax.YLim = [-10 10];
ax.DataAspectRatio = [1 1 1];

% connect game pad to world
gamepad = KeyboardEmulator(fig);

% create blue square and move it to ax
f2 = figure(2);
hblue = fill([0 1 1 0 0],[0 0 1 1 0],'b');
hblue.Parent = ax;
close(f2);

% main game loop
while(1)
    gamepad.update()
    
    hblue.XData = hblue.XData + gamepad.jlx;
    hblue.YData = hblue.YData + gamepad.jly;
    
    pause(0.01);
end



