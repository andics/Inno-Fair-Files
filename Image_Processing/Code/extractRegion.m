function [finalImage] = extractRegion(imageFile, binaryRegion)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    imageFile = equalSizeImage(imageFile, binaryRegion);

finalImage = imageFile.*binaryRegion;

end

