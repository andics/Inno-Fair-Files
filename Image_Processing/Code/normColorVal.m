function [finalImage] = normColorVal(imageFile)
%Normalizing values of image over 255

finalImage = mat2gray(imageFile, [0,255]);

end

