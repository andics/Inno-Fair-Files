function [outputImage] = equalSizeImage(imageFile, finalImage)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if size(imageFile,1)~=size(finalImage,1)
    
    imageFile = imageFile(2:end-1, :);
    
end 

if size(imageFile,2)~=size(finalImage,2)
    
    imageFile = imageFile(:, 2:end-1);
    
end 

outputImage = imageFile;
end

