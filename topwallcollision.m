function [collision]= topwallcollision(patch1)
    collision = any(topwall(patch1.XData) < patch1.YData);
end