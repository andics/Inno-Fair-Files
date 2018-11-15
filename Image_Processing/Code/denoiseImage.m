function [outputImage] = denoiseImage(inputImage, sigma)
%Denoise a 0-255 color scale image

inputImage = double(inputImage);
outputImage = PDHGMp(inputImage, 0.2, 0.5, sigma);

end

