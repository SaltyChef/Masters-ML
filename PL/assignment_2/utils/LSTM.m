function resultado = LSTM(patient, hasBalance, hasEnconding, numFeatures, numHiddenUnits, maxEphocs)
    
    file_name = "../models/classifiers/LSTM_";

    % Choosing patient A or B
    if(patient == 1)
        load '../dataset/44202.mat' FeatVectSel Trg
        file_name = file_name + "44202_";
    elseif(patient == 2)
        load '../dataset/63502.mat' FeatVectSel Trg
        file_name = file_name + "63502_";
    end
    P = FeatVectSel;
    T = correctTarget2(Trg);
    
     %Has Auto-enconders
    if(hasEnconding)
        if(patient == 1)
            load '../models/autocoender/autoCoender44202.mat' auto
        elseif(patient == 2)
            load '../models/autocoender/autoCoender63502.mat' auto
        end
        file_name = file_name + "AUTO_";
        P = predict(auto,P);
    end

    % Divinding the dataset and target into treino + test
    [data_treino,data_test,target_treino,target_test] = divideDataset(P,T ,0.85);

    % INVERTING P AND T
    data_treino = data_treino';
    target_treino = target_treino';
    data_test = data_test';
    target_test = target_test';

    
    %balacing train
    if(hasBalance == 1)
        [data_treino, target_treino] = balanceTrainSet(data_treino, target_treino);  
        file_name = file_name + "B_";
    end
   
   
    data_treino=num2cell(data_treino,1);
   
    target_treino=categorical(target_treino);

    numClasses=3;
    
    layers=[
        sequenceInputLayer(numFeatures)
        lstmLayer(numHiddenUnits,'OutputMode','last')
        fullyConnectedLayer(numClasses)
        softmaxLayer
        classificationLayer

    ];
    options=trainingOptions('adam', ...
        'MaxEpochs',maxEphocs,...
        'GradientThreshold',1,...
        'Shuffle', 'every-epoch', ...
        'InitialLearnRate',0.005,...
        'LearnRateDropFactor',0.2, ...
        'Verbose',0, ...
        'Plots','training-progress');
    net=trainNetwork(data_treino , target_treino,layers,options);

    file_name = file_name + numFeatures + "F_" +numHiddenUnits+"H_" + maxEphocs + "Ep.mat";
    save(file_name,"net");


end