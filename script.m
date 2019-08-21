 
parentDir = './';
dataDir = 'eg';
helperCreateEMGDirectories(EMGData,parentDir,dataDir)

%%
helperPlotReps(EMGData)

%%
Fs = 4000;
fb = cwtfilterbank('SignalLength',1000,...
    'SamplingFrequency',Fs,...
    'VoicesPerOctave',12);
sig = EMGData.Data(1,1:1000);
[cfs,frq] = wt(fb,sig);
t = (0:999)/Fs;figure;pcolor(t,frq,abs(cfs))
set(gca,'yscale','log');shading interp;axis tight;
title('Scalogram');xlabel('Time (s)');ylabel('Frequency (Hz)')

%%
helperCreateRGBfromTF(EMGData,parentDir,dataDir)

%%
allImages = imageDatastore(fullfile(parentDir,dataDir),...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

%%
rng default
[imgsTrain,imgsValidation] = splitEachLabel(allImages,0.75,'randomized');
disp(['Number of training images: ',num2str(numel(imgsTrain.Files))]);
disp(['Number of validation images: ',num2str(numel(imgsValidation.Files))]);

%%
net = googlenet;

%%
lgraph = layerGraph(googlenet);
numberOfLayers = numel(lgraph.Layers);
figure('Units','normalized','Position',[0.1 0.1 0.8 0.8]);
plot(lgraph)
title(['GoogLeNet Layer Graph: ',num2str(numberOfLayers),' Layers']);

%%
net.Layers(1)

%%
lgraph = removeLayers(lgraph,{'pool5-drop_7x7_s1','loss3-classifier','prob','output'});

numClasses = numel(categories(imgsTrain.Labels));
newLayers = [
    dropoutLayer(0.6,'Name','newDropout')
    fullyConnectedLayer(numClasses,'Name','fc','WeightLearnRateFactor',5,'BiasLearnRateFactor',5)
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classoutput')];
lgraph = addLayers(lgraph,newLayers);

lgraph = connectLayers(lgraph,'pool5-7x7_s1','newDropout');
inputSize = net.Layers(1).InputSize;

%%
options = trainingOptions('sgdm',...
    'MiniBatchSize',15,...
    'MaxEpochs',20,...
    'InitialLearnRate',1e-4,...
    'ValidationData',imgsValidation,...
    'ValidationFrequency',10,...
    'Verbose',1,...
    'ExecutionEnvironment','cpu',...
    'Plots','training-progress');

%%
rng default
trainedGN = trainNetwork(imgsTrain,lgraph,options);

%%
trainedGN.Layers(end-2:end)
cNames = trainedGN.Layers(end).ClassNames;

%%
[YPred,probs] = classify(trainedGN,imgsValidation);
accuracy = mean(YPred==imgsValidation.Labels);
display(['GoogLeNet Accuracy: ',num2str(accuracy)])

%%
alex = alexnet;

%%
layers = alex.Layers;

%%
layers(23) = fullyConnectedLayer(8);
layers(25) = classificationLayer;

%%
inputSize = alex.Layers(1).InputSize;
augimgsTrain = augmentedImageDatastore(inputSize(1:2),imgsTrain);
augimgsValidation = augmentedImageDatastore(inputSize(1:2),imgsValidation);

%%
rng default
mbSize = 32;
mxEpochs = 1;
ilr = 1e-3;
plt = 'training-progress';

opts = trainingOptions('sgdm',...
    'InitialLearnRate',ilr, ...
    'MaxEpochs',mxEpochs ,...
    'MiniBatchSize',mbSize, ...
    'ValidationData',augimgsValidation,...
    'ValidationFrequency',16, ...
     'ValidationPatience',5, ...
    'ExecutionEnvironment','parallel',...
    'Plots',plt);

trainedAN = trainNetwork(augimgsTrain,layers,opts);

%% resnet18
resnet18();
%%
options = trainingOptions('sgdm', ...
    'MiniBatchSize',128, ...
    'MaxEpochs',1, ...
    'InitialLearnRate',1e-3, ...
    'ValidationData',imgsValidation, ...
    'ValidationFrequency',25, ...
    'ExecutionEnvironment','parallel',...
    'Plots','training-progress');

net = trainNetwork(imgsTrain,r18,options);

