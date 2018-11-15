function [normalizedImage] = normImageScale(imageFile)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

maxval = max(imageFile(:));
minval = min(imageFile(:));
valrange = double(maxval) - double(minval);
normalizedImage = uint8( 255 * (double(imageFile) - double(minval)) ./ valrange );

end

