function Y = myclassify(data,filled_inx)
    load classifier2L.mat;
    load linearClassifier.mat
    load sigmoidClassifier.mat
    load hardlimClassifier.mat
    load PerceptronFilter.mat
    load softmaxClassifier.mat
    load AssoFilter.mat
    load testingP_in_numbers.mat;
    
    %2 layer classifier
    %Y = sim(classifier2L, data);
    
    %1 layer classifiers
    %Y = sim(linearClassifier, data);
    %Y = sim(hardlimClassifier, data);
    %Y = sim(sigmoidClassifier, data);
    Y = sim(softmaxClassifier, data);
    
    %filters
    %P2 = sim(netP, data);
    %P2 = sim(am, data);
    
    %classifiers for filter + classifier
    %Y = sim(linearClassifier, P2);
    %Y = sim(sigmoidClassifier, P2);
    %Y = sim(hardlimClassifier, P2);
    
    
    Y = getNumbers(Y);
    getPercentageOfCorrect(Y, testingP_in_numbers)
    
end

