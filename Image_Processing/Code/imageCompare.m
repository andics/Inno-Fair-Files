function imageCompare(imageFinal, imageOriginal)
%Compares quality of images by several metrics systems

fontsize = 16;

imageFinal = double(normImageScale(imageFinal));
imageOriginal = double(normImageScale(imageOriginal));


if size(imageOriginal)~=size(imageFinal)
    imageOriginal = imresize(imageOriginal, size(imageFinal), 'nearest');
end

%Refference metric systems
snratio = psnr(imageFinal, imageOriginal);
mserror = immse(imageFinal, imageOriginal);
structSim = ssim(imageFinal, imageOriginal);


%Non-refference metrix systems
brisqueOrg = brisque(imageOriginal);
brisqueFinal = brisque(imageFinal);
niqeOrg = niqe(imageOriginal);
niqeFinal = niqe(imageFinal);

%Refference metric comparison
strRef = {sprintf('Refference metric systems comparison \n \n') ,sprintf('Peak signal to noise ratio: %0.4f \n', snratio), sprintf('Mean square error: %0.4f \n', mserror), sprintf('Structure similarity index: %0.4f', structSim)};

%Non- refference metric systems original image
strOrg = {'Non- refference quality metrics','', sprintf('BRISQUE score for Original image is %0.4f.\n',brisqueOrg), sprintf('NIQE score for Original image is %0.4f.',niqeOrg)};
strFinal = {sprintf('BRISQUE score for Final image is %0.4f.\n',brisqueFinal), sprintf('NIQE score for Final image is %0.4f.\n',niqeFinal)};

%Create a figure on full screen
figure;
set(gcf,'units','normalized','outerposition',[0 0 1 1])

subplot(1,3,2);
axis off;

text(0.0,0.8, strRef);
text(0.0, 0.5, strOrg);
text(0.0, 0.2, strFinal);


subplot(1,3,1);
imshow(imageOriginal, []);
title('Original Image', 'FontSize', fontsize);
axis on;

subplot(1,3,3);
imshow(imageFinal, []);
title('Final Image', 'FontSize', fontsize);
axis on;

end

