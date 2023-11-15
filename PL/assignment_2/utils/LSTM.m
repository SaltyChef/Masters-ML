function resultado = LSTM(P,T)

    XTrain=P;
    YTrain=correctTarget(T);
    
    percentage = 0.85;
    
    breakingIndex = round(length(XTrain) * percentage);
    data_treino = XTrain(1:breakingIndex, :);
    data_test = XTrain(breakingIndex+1:end , :);
    
    target_treino = YTrain(1:breakingIndex, :);
    target_test = YTrain(breakingIndex+1:end , :);
    
    edges=min(min(data_treino)):0.1:max(max(data_treino));
    data_treino=discretize(data_treino,edges);
    data_treino=categorical(data_treino);

    target_treino=categorical(target_treino);

    numFeatures=29;
    numHiddenUnits = 100;
    numClasses=3;
    
    layers=[
        sequenceInputLayer(numFeatures)
        lstmLayer(numHiddenUnits,'OutputMode','last')
        fullyConnectedLayer(numClasses)
        softmaxLayer
        classificationLayer
    ];
    options=trainingOptions('adam', ...
        'MaxEpochs',250,...
        'GradientThreshold',1,...
        'InitialLearnRate',0.005,...
        'LearnRateDropFactor',0.2, ...
        'Verbose',0, ...
        'Plots','training-progress');
    net=trainNetwork(data_treino',target_treino',layers,options);
end