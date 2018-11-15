function [deblurredImage, firstPSF, finalPSF] = imageDeconv(imageFile, deblurringSize, standardDeviation, degOfSimilarity)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

fontsize = 16;

finalPSF = fspecial('gaussian', deblurringSize, standardDeviation);
firstPSF = finalPSF;

for i=1:1:degOfSimilarity-1
    [deblurredImage, orgPSF] = deconvblind(imageFile, finalPSF);
    finalPSF = orgPSF;
end

[deblurredImage, orgPSF] = deconvblind(imageFile, finalPSF);

end

