function [betterImage] = resolutionIncrease(originalImage)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fontsize = 16;

imageMatrix = originalImage;

newImage = zeros(size(imageMatrix)*2);

newImage(1) = imageMatrix(1);
newImage(1,end) = imageMatrix(1,end);
newImage(end,1) = imageMatrix(end,1);
newImage(end) = imageMatrix(end);

for i=3:2:size(newImage,1)
   for j=3:2:size(newImage,2)-1
       corespondingY = (i+1)/2;
       corespondingX = (j+1)/2;
        newImage(i,j) = imageMatrix(corespondingY,corespondingX)*(9/16)+imageMatrix(corespondingY-1,corespondingX)*(3/16)+imageMatrix(corespondingY,corespondingX-1)*(3/16)+imageMatrix(corespondingY-1,corespondingX-1)*(1/16);
   end
end


for i=3:2:size(newImage,1)-1
   for j=2:2:size(newImage,2)-2
       corespondingY = (i+1)/2;
       corespondingX = j/2;
        newImage(i,j) = imageMatrix(corespondingY,corespondingX)*(9/16)+imageMatrix(corespondingY-1,corespondingX)*(3/16)+imageMatrix(corespondingY,corespondingX+1)*(3/16)+imageMatrix(corespondingY-1,corespondingX+1)*(1/16);
       end
end

for i=2:2:size(newImage,1)-2
   for j=3:2:size(newImage,2)-1
       corespondingY = i/2;
       corespondingX = (j+1)/2;
        newImage(i,j) = imageMatrix(corespondingY,corespondingX)*(9/16)+imageMatrix(corespondingY+1,corespondingX)*(3/16)+imageMatrix(corespondingY,corespondingX-1)*(3/16)+imageMatrix(corespondingY+1,corespondingX-1)*(1/16);
       end
end

for i=2:2:size(newImage,1)-2
   for j=2:2:size(newImage,2)-1
       corespondingY = i/2;
       corespondingX = j/2;
        newImage(i,j) = imageMatrix(corespondingY,corespondingX)*(9/16)+imageMatrix(corespondingY+1,corespondingX)*(3/16)+imageMatrix(corespondingY,corespondingX+1)*(3/16)+imageMatrix(corespondingY+1,corespondingX+1)*(1/16);
       end
end

subplot(2,3,2);
imshow(newImage, []);
title('Increased Resolution Image', 'FontSize', fontsize);
axis on;

betterImage = newImage;

end

