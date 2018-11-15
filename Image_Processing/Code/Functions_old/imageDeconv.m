function [deblurredImage] = imageDeconv()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
clc;	% Clear command window.	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;

fontsize = 16;

imageRegionNormal = getPixels('IM00001.dcm');
imageFile = resolutionIncrease(imageRegionNormal);

deblurringSize = 12;
standardDeviation = 1;

PSF = fspecial('gaussian', deblurringSize, standardDeviation);

[deblurredImage, orgPSF] = deconvblind(imageFile, PSF);


figure;

subplot(2,3,1);
imshow(imageRegionNormal, []);
title('Normal Image', 'FontSize', fontsize);
axis on;

subplot(2,3,2);
imshow(imageFile, []);
title('Super resolution image', 'FontSize', fontsize);
axis on;


subplot(2,3,3);
imshow(deblurredImage, []);
title('Deblurred Image', 'FontSize', fontsize);
axis on;

subplot(2,3,6);
imshow(orgPSF, []);
title('Reworked PSF', 'FontSize', fontsize);
axis on;

subplot(2,3,5);
imshow(PSF, []);
title('Used PSF', 'FontSize', fontsize);
axis on;

end

