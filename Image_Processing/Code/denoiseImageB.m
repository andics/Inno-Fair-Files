function [outputImage] = denoiseImageB(imageFile, sigma)
%Denoise image and give a "binary" output

imageFile = regularizeImageScale(imageFile);
outputImage = PDHGMp_B(imageFile, 0.2, 0.5, sigma);

end

