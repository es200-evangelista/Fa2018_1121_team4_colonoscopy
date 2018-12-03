%% random enemies 
badguyok = 0;
i=1;
    while (i<=10)
  b = randi(3000,1)
  c = randi(301,1)-150
  hbadguy = fill([b,b,b+20,b+20,b],[c,c+20,c+20,c,c],'g')
  pause(0.01); 
%  if (hbadguy.YData >= z || hbadguy.YData <= y)
   %topwallcollision(hbadguy)
   %bottomwallcollision(hbadguy)
   %topwallcollision(hbadguy) || bottomwallcollision(hbadguy)
   if (topwallcollision(hbadguy) || bottomwallcollision(hbadguy))
      disp('bad badguy - make a new one');
      badguyok = 0;
      %clear hbadguy
      delete([hbadguy]);
      pause(0.01); 
   else 
      disp('good badguy'); 
      badguyok = 1;
      i = i+1
  end 
    end