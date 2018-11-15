function [finalImage] = imageRemoveBg(imageFile)
%FFunction for segmenting the bone from the background

mask = zeros(size(imageFile));
mask(25:end-25,25:end-25) = 1;

bw = activecontour(imageFile,mask,500);

finalImage = removeBinarySpots(bw);

end

