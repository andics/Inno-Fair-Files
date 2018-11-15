function [selectedRegion] = getPixels(file)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

fontSize = 16;

imageFileInfo = dicominfo(file);
imageFile = dicomread(imageFileInfo);

imshow(imageFile, []);

title('Original Grayscale Image', 'FontSize', fontSize);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
message = sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish');
%uiwait(msgbox(message));
hFH = imrect();
xy = hFH.getPosition;
binaryCropp = hFH.createMask();
imageCropped = imcrop(imageFile, xy);

% Now make it smaller so we can show more images.
subplot(2, 3, 1);
imshow(imageFile, []);
axis on;
drawnow;
title('Original Grayscale Image', 'FontSize', fontSize);
% Display the freehand mask.
subplot(2, 3, 3)
imshow(imageCropped, []);
axis on;
title('Selected region', 'FontSize', fontSize);

%Display region boundries on original image
structBoundaries = bwboundaries(binaryCropp);
xy=structBoundaries{1}; % Get n by 2 array of x,y coordinates.
x = xy(:, 2); % Columns.
y = xy(:, 1); % Rows.
subplot(2, 3, 1); % Plot over original image.
hold on; % Don't blow away the image.
plot(x, y, 'LineWidth', 2);
drawnow;


% Label the binary image and computer the centroid and center of mass.
measurements = regionprops(binaryCropp, imageFile, ...
    'area', 'Centroid', 'WeightedCentroid', 'Perimeter');
area = measurements.Area;
centroid = measurements.Centroid;
centerOfMass = measurements.WeightedCentroid;
perimeter = measurements.Perimeter;

numberOfPixels2 = bwarea(binaryCropp);

subplot(2,3,4);
str = {'Area of marked region: ' area, 'Perimeter of marked region: ' perimeter};
text(0.5,0.5, str);
axis off;

subplot(2,3,6);
[rows, columns] = size(imageCropped);
formatSpec = "Dimensions: %d x %d";
str = sprintf(formatSpec, rows, columns);
text(0.5,0.5, str);
axis off;

maxval = max(imageCropped(:));
minval = min(imageCropped(:));
valrange = double(maxval) - double(minval);
grayImage = uint8( 255 * (double(imageCropped) - double(minval)) ./ valrange );

%{
%Show gray scale 0-255 format dicom image
subplot(2,3,5);
imshow(grayImage, []);
title('dicom 0-255 color scale', 'FontSize', fontSize);
%}

selectedRegion = grayImage;

%Ye boy

end

