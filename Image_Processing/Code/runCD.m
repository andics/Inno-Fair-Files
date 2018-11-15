function [finalImage] = runCD(numberOfCycles, imageFile)
%Run Chaikin + Deblurring + Denoising at each iteration

clc;	% Clear command window.	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;

fontsize = 16;

SDPSF = 1.6;
sizePSF = round(SDPSF*6+1);
degSim = 2;

sigma = 50;
sigmaB = 0.008;

imageSR = resolutionIncrease(imageFile);

subplot(2,3,3);
imshow(imageSR, []);
title('One time SR Image', 'FontSize', fontsize);
axis on;

for i=1:numberOfCycles
    
formatSpec = "Cycle number %d (Chaikin + Deblurring)";
str = sprintf(formatSpec, i);
figure("Name", str);
set(gcf,'units','normalized','outerposition',[0 0 1 1])

subplot(2,4,1);
imshow(imageFile, []);
title('Before new SR', 'FontSize', fontsize);
axis on;

imageSR = resolutionIncrease(imageFile);

[imageFile, firstPSF, finalPSF] = imageDeconv(imageSR, sizePSF, SDPSF, degSim);
%imageFile = normImageScale(imageFile);
imageFile = min(imageFile,255);
imageFileCon = transpose(imageFile);
imageFileCon = min(imageFileCon,255);
imageFile = transpose(imageFileCon);

%Displaying parameters
subplot(2,4,8)
axis off;

str = {sprintf('Cycle number: %d \n', numberOfCycles), sprintf('Deblurring - PSF size = %d \n', sizePSF), sprintf('Deblurring - PSF standard deviation = %f \n', SDPSF), sprintf('Deblurring - PSF degrees of similarity = %d \n \n', degSim), sprintf('Denoising - sigma = %f \n', sigma), sprintf('Denoising Binary - sigma = %f ', sigmaB)};
text(0.0,0.5, str);

subplot(2,4,2);
imshow(imageSR, []);
title('After new SR', 'FontSize', fontsize);
axis on;


subplot(2,4,3);
imshow(imageFile, []);
title('After SR-Deblurring', 'FontSize', fontsize);
axis on;

denoisedImage = denoiseImage(imageFile, sigma);
denoisedImageB = denoiseImageB(imageFile, sigmaB);

%Noise removal
subplot(2,4,4);
imshow(denoisedImage, []);
title('After SR-Deblurring-Denoising', 'FontSize', fontsize);

%Binary noise removal
subplot(2,4,7);
imshow(denoisedImageB, []);
title('After SR-Deblurring-Denoising-DenoisingB', 'FontSize', fontsize)

subplot(2,4,6);
imshow(finalPSF, []);
title('Final used PSF', 'FontSize', fontsize);
axis on;

subplot(2,4,5);
imshow(firstPSF, []);
title('Initial PSF', 'FontSize', fontsize);
axis on;

end

finalImage = imageFile;

end

