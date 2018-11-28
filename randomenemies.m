badguyok = 0;
i=0;
    while (i<=10)
  b = randi(3000,1)
  c = randi(150,1)
  hbadguy = fill([b,b,b+5,b+5,b],[c,c+2,c+2,c,c],'r')
  if (topwallcollision(hbadguy) || bottomwallcollision(hbadguy))
      disp('bad badguy - make a new one');
      badguyok = 0;
      clear hbadguy
  else 
      badguyok = 1;
      i = i+1
  end 
    end
