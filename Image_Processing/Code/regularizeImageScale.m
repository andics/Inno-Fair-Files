function [outputImage] = regularizeImageScale(inputImage)
%Convert pixel values in the range of 0-1

outputImage = mat2gray(inputImage, [0,1]);

end

