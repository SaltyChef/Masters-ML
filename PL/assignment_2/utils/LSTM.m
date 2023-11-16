function resultado = LSTM(P,T, hasBalance)
    %balacing train
    if(hasBalance)
        [P, T] = balanceTrainSet(P', T');  
    end

    XTrain=P';
    YTrain=correctTarget2(T');

    percentage = 0.85;
    
    breakingIndex = round(length(XTrain) * percentage);
    data_treino = XTrain(1:breakingIndex, :);
    target_treino = YTrain(1:breakingIndex, :);
    

     


    data_treino=num2cell(data_treino',1);
   


    target_treino=categorical(target_treino);

    numFeatures=29;
    numHiddenUnits = 10;
    numClasses=3;
    
    layers=[
        sequenceInputLayer(numFeatures)
        lstmLayer(numHiddenUnits,'OutputMode','last')
        fullyConnectedLayer(numClasses)
        softmaxLayer
        classificationLayer

    ];
    options=trainingOptions('adam', ...
        'MaxEpochs',5,...
        'GradientThreshold',1,...
        'InitialLearnRate',0.005,...
        'LearnRateDropFactor',0.2, ...
        'Verbose',0, ...
        'Plots','training-progress');
    net=trainNetwork(data_treino , target_treino,layers,options);
    save("LSTM.mat","net");
end