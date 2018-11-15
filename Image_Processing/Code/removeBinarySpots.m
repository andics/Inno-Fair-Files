function [finalImage] = removeBinarySpots(imageFile)
%Remove black sports on a white surrounding in a binary image

finalImage = imageFile;

if isVertical(imageFile)
    finalImage(1,:) = 1;
    finalImage(end,:) = 1;
    
    finalImage = imfill(finalImage,'holes');

    finalImage = finalImage(2:end-1, :);
    
else
    finalImage(:,1) = 1;
    finalImage(:,end) = 1;

    finalImage = imfill(finalImage,'holes');

    finalImage = finalImage(:, 2:end-1);
    
end


end

