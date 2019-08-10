function helperPlotReps(EMGData)
% This function is only intended to support the ECGAndDeepLearningExample.
% It may change or be removed in a future release.

folderLabels = unique(EMGData.Labels);

for k=1:5
    emgType = folderLabels{k};
    ind = find(ismember(EMGData.Labels,emgType));
    subplot(5,1,k)
    plot(EMGData.Data(ind(1),1:1000));
    grid on
    title(emgType)
end
end
