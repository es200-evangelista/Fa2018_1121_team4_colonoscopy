function [collision] = bottomwallcollision(patch1)
    collision = any(bottomwall(patch1.XData) > patch1.YData);
end