function [betterImage] = resolutionIncrease(originalImage)
%Resolution increasement using chaikin subdivision


fontsize = 16;

imageMatrix = originalImage;

newImage = zeros(size(imageMatrix)*2);

%Setting corner pixels
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

%{
%Start first pixel top&bottom

for i=3:2:size(newImage,2)-1
   corespondingX=(i+1)/2;
   newImage(1,i) = imageMatrix(1,corespondingX)*(12/16)+imageMatrix(1,corespondingX-1)*(4/16);
end

for i=3:2:size(newImage,2)-1
   corespondingX=(i+1)/2;
   newImage(end,i) = imageMatrix(end,corespondingX)*(12/16)+imageMatrix(end,corespondingX-1)*(4/16);
end

%Finished first pixel top&bottom

%Start second pixel top&bottom

for i=2:2:size(newImage,2)-2
   corespondingX=i/2;
   newImage(1,i) = imageMatrix(1,corespondingX)*(12/16)+imageMatrix(1,corespondingX+1)*(4/16);
end

for i=2:2:size(newImage,2)-2
   corespondingX=i/2;
   newImage(end,i) = imageMatrix(end,corespondingX)*(12/16)+imageMatrix(end,corespondingX+1)*(4/16);
end

%Finished second pixel top&bottom

%Start pixels left

for i=2:2:size(newImage,1)-2
   corespondingY=i/2;
   newImage(i,1) = imageMatrix(corespondingY,1)*(12/16)+imageMatrix(corespondingY+1,1)*(4/16);
end

for i=3:2:size(newImage,1)-1
   corespondingY=(i+1)/2;
   newImage(i,1) = imageMatrix(corespondingY,1)*(12/16)+imageMatrix(corespondingY-1,1)*(4/16);
end

%Finished pixels left

%Start pixels right

for i=3:2:size(newImage,1)-1
   corespondingY=(i+1)/2;
   newImage(i,end) = imageMatrix(corespondingY,end)*(12/16)+imageMatrix(corespondingY-1,end)*(4/16);
end

for i=2:2:size(newImage,1)-2
   corespondingY=i/2;
   newImage(i,end) = imageMatrix(corespondingY,end)*(12/16)+imageMatrix(corespondingY+1,end)*(4/16);
end
%Finished pixels right
%}

newImage = newImage(2:end-1, 2:end-1);

betterImage = newImage;

end

