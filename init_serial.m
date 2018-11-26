%attempt to connect a joystick

%open serial port from lecture

%see if I can print out the expected $JOTSTK,FFFF,512,512,512,512*33

s = serial('COM9');
set(s, 'BaudRate',9600);
set(s, 'DataBits',8)
set(s, 'Parity', 'None');
set(s, 'StopBits', 1);
set(s, 'FlowControl', 'None');
set(s, 'TimeOut', 0.5);
fopen(s); 

%see if I can print out the expected 
%to test I can do like this
fscanf(s,"%s");