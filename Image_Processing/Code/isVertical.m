function [angle] = isVertcal(imageFile)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

angle = regionprops(imageFile, 'Orientation');
angle = angle(1).Orientation;

if abs(angle)>45
    angle = true;

else
    angle = false;
        
end
    
end

