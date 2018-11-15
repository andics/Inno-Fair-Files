function [finalImage, imageSuperR] = runC1D(numberOfCycles, imageFile)
%Run Chaikin at each cycle + One time Deblurring + Denoising at the end

clc;	% Clear command window.	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;

fontsize = 16;

imageOriginal = imageFile;


SDPSF = 5;
sizePSF = round(6*SDPSF+1);
degSim = 2;

sigma = 0.001;
sigmaB = 0.001;

for i=1:numberOfCycles
    
formatSpec = "Cycle number %d (Chaikin + Once Deblurring)";
str = sprintf(formatSpec, i);
figure("Name", str);
set(gcf,'units','normalized','outerposition',[0 0 1 1])

subplot(2,4,1);
imshow(imageOriginal, []);
title('Original Image', 'FontSize', fontsize);
axis on;

imageFile = resolutionIncrease(imageFile);

subplot(2,4,2);
imshow(imageFile, []);
title('After new SR', 'FontSize', fontsize);
axis on;

end

imageSuperR = imageFile;

testLimitSD = 10;
%testSD(imageFile,testLimitSD)


[imageDeblurred, firstPSF, finalPSF] = imageDeconv(imageFile, sizePSF, SDPSF, degSim);

%Normalizing values of image over 255
imageDeblurred = normColorVal(imageDeblurred);

testLimitSigma = 0.03;
%testSigma(imageDeblurred,testLimitSigma)

%Displaying parameters
subplot(2,4,8)
axis off;

str = {sprintf('Cycle number: %d \n', numberOfCycles), sprintf('Deblurring - PSF size = %d \n', sizePSF), sprintf('Deblurring - PSF standard deviation = %f \n', SDPSF), sprintf('Deblurring - PSF degrees of similarity = %d \n \n', degSim), sprintf('Denoising - sigma = %f \n', sigma), sprintf('Denoising Binary - sigma = %f ', sigmaB)};
text(0.0,0.5, str);

subplot(2,4,3);
imshow(imageDeblurred, []);
title('After SR-Deblurring', 'FontSize', fontsize);
axis on;

denoisedImage = denoiseImage(imageDeblurred, sigma);

denoisedImageB = denoiseImageB(imageDeblurred, sigmaB);

%Noise removal
subplot(2,4,4);
imshow(denoisedImage, []);
title('After SR-Deblurring-Denoising', 'FontSize', fontsize);

%Binary noise removal
subplot(2,4,7);
imshow(denoisedImageB, []);
title('After SR-Deblurring-Denoising Normalized', 'FontSize', fontsize);

subplot(2,4,6);
imshow(finalPSF, []);
title('Final used PSF', 'FontSize', fontsize);
axis on;

subplot(2,4,5);
imshow(firstPSF, []);
title('Initial PSF', 'FontSize', fontsize);
axis on;

finalImage = denoisedImageB;

imageCompare(denoisedImageB, imageDeblurred)

formatSpec = "Image binary background removed";
str = sprintf(formatSpec, i);
figure("Name", str);
set(gcf,'units','normalized','outerposition',[0 0 1 1])

subplot(1,3,3);
imshow(imageRemoveBg(denoisedImageB), []);
title('Removed background image denoised', 'FontSize', fontsize);
axis on;

subplot(1,3,2);
imshow(imageRemoveBg(imageDeblurred), []);
title('Removed background image deblurred', 'FontSize', fontsize);
axis on;

objectBinaryMask = imageRemoveBg(imageFile);

subplot(1,3,1);
imshow(objectBinaryMask, []);
title('Removed background image SR', 'FontSize', fontsize);
axis on;

removedBgImage = extractRegion(denoisedImageB, objectBinaryMask);

clusteredImage = clusterColors(removedBgImage,3);

imageCompare(imageSuperR, imageOriginal)
imageCompare(removedBgImage, imageOriginal)
imageCompare(clusteredImage, imageOriginal)
imageCompare(clusteredImage, imageOriginal)

finalImage = removedBgImage;

end

