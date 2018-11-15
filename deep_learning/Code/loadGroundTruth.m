function [] = loadGroundTruth(filePath, gTruthName)
%Load ground truth object if it exists
%If it doesn't, create one from the provided labeled images
labeledDataDirName = 'labeled';

%Check if a labeled folder exists
if ~isdir(fullfile(filePath, labeledDataDirName))
    fprintf(join(['A label folder not found in the path: ', filePath, '\n']))
    return;
end

filePath = fullfile(filePath, labeledDataDirName);

if filePath(end) == '/'
   filePath(end) = ''
end

%Accepted labeled image folder names
labelDirNames = {'PixelLabelData', 'Labeled_Images'};

if nargin<2
   gTruthName = 'gTruth.mat';
end

fileToLoad = fullfile(filePath, gTruthName);
matFileExists = 0;

if exist(fileToLoad)
warning(''); % Clear last warning message
gTruth = load(fileToLoad);
gTruth = gTruth.('gTruth');
[~, warnId] = lastwarn;
matFileExists = 1;
    if isempty(warnId)
        %The founded file gave no warnings!
        fprintf('Ground truth .mat file found and loaded with no issues! \n');
    return;
    end
end

   %Get the paths of all images in the Labeled_images folder
   files = dir(filePath);
   subDirs = [files.isdir];
   subDirs = files(subDirs);
   index = contains({subDirs.name}, labelDirNames);
   if ~isempty(subDirs(index)) && length(subDirs(index)) == 1
      labelFilesFolder = fullfile(filePath, subDirs(index).name)
   else
       fprintf('Please make sure that a single folder with labeled images exists in the label directory! \n');
       return;
   end
   
   labeledImgNames  = dir(fullfile(labelFilesFolder, '*.jpg'));
   labeledImgPaths = fullfile(labelFilesFolder, {labeledImgNames.name})';
   labeledImgPaths = natsort(labeledImgPaths)
   
   
   %Get paths of original images
   
   DinPath = strfind(filePath, '\');
   orgImagesPaths = filePath(1:DinPath(end) - 1)
   
   orgImgNames = dir(fullfile(orgImagesPaths, '*.jpg'));
   orgImgNames = natsort({orgImgNames.name});
   orgImgNames = orgImgNames(1:length(labeledImgPaths));
   
   orgImagesPaths = fullfile(orgImagesPaths, orgImgNames)'

   labelIDs = [1];
   labelNames = cellstr(["suture"]);
   imgLabeled = imread(labeledImgPaths{1});
   
   imgLabeledCat = categorical(imgLabeled, labelIDs, labelNames);

   imgOrg = imread(orgImagesPaths{1});
   
%   imshow(labeloverlay(imgOrg,imgLabeledCat));
   
   
   return;
   
   
   

labelDefinitions = gTruth.LabelDefinitions
dataFilePaths = gTruth.DataSource.Source
labelFilePaths = gTruth.LabelData.PixelLabelData

imgNum = 1;

imgOrg = imread(dataFilePaths{imgNum});
imgLabeled = imread(labelFilePaths{imgNum});



end

