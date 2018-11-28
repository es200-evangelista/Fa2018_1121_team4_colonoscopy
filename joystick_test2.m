%joystick_test2

figure(1); %create start of plot
axis([-20 20 -20 20]);
hold on 

%Joystick has a buffer, 
flushinput(s)
while(1)
    dat = fscanf(s);
    %Parsing the $JOYSTK,FFFF,512,512,512,512*33 into actual numbers
    [nochksum,chksum] = strread(dat,'%s%d','delimiter','*');
    [hdr,btnstr,jlx,jly,jrx,jry] = strread(nochksum{1},'%s%s%d%d%d%d','delimiter',',');
    pause(0.002);
    hex2dec(btnstr);
    A=((jly-520)/(jlx-520));  
    arrowwidth = [0 10 10 0 0];
    arrowheight = [0 0 1 1 0];
    if A ~= Inf
        arrowheight=A*arrowheight;
        arrow = fill(arrowwidth, arrowheight, 'g');
    end
    if A == Inf
        arrow = fill(arrowwidth,arrowheight, 'w');
    end
end
