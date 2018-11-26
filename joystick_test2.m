%joystick_test2

figure(1); %create start of plot
axis([0 1024 0 1024]);
hold on 

%Joystick has a buffer, 
flushinput(s)
while(1)
    dat = fscanf(s);
    %Parsing the $JOYSTK,FFFF,512,512,512,512*33 into actual numbers
    [nochksum,chksum] = strread(dat,'%s%d','delimiter','*');
    [hdr,btnstr,jlx,jly,jrx,jry] = strread(nochksum{1},'%s%s%d%d%d%d','delimiter',',');
    pause(0.002);
    hex2dec(btnstr)
end
