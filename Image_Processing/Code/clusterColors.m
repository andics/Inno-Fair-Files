function [finalImage] = clusterColors(inputImage, nColors)
%cluster image regions and segment the suture

nrows = size(inputImage,1);
ncols = size(inputImage,2);
inputImage = reshape(inputImage,nrows*ncols,1);

% repeat the clustering 3 times to avoid local minima
opts = statset('Display','final');
[idx,C] = kmeans(inputImage,nColors,'Distance','sqEuclidean',...
    'Replicates',5,'Options',opts);

finalImage = reshape(idx,nrows,ncols);

end

