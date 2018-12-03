function [collision] = badguycollision(patch1)
    collision = any(hbadguy(patch1.XData) > patch1.YData);
end
