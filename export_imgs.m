
datasetFileName = 'rit18_data.mat';
exportFolder = 'output_imgs';
exportedImgName='rgb_8bits.png';
datasetFolder = 'dataset';


if ~exist(datasetFileName)
    fprintf('Downloading dataset\n');
    url='http://www.cis.rit.edu/~rmk6217/rit18_data.mat';
    fprint('from %s',url);
    websave(datasetFileName,url);
else
    fprintf('dataset already exist!\n');
end

if ~exist(exportFolder)
    mkdir(exportFolder);
    fprintf('creating exporting folder, %s',exportFolder)
else
    fprintf('exporting folder already exist!\n');
end

load(datasetFileName);
imgRGB=permute(test_data(1:3,:,:),[3,2,1]);
imshow(imgRGB);
imwrite(imgRGB,fullfile(exportFolder,exportedImgName),'BitDepth',8);