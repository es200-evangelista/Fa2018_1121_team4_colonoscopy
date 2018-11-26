%joystick_test
%Run init_serial.m BEFORE DOING THE SCRIPT!

%Joystick has a buffer, 
flushinput(s)
while(1)
    fscanf(s,"%s")
    pause(0.02);
end

