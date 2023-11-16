%patient        ->  44202 | 63502
%hasBalance     ->  0 -> no | 1->yes
%solverName     ->  adam
%pool           ->  max | average
%hasEnconding   ->  0 -> no | 1->yes
function resultado = cnnClassify(patient, hasBalance, Pool, PoolSize,PoolStride,NumFilters,FilterSize, numLayers, layerStride, maxEpochs)
    file_name = "../models/classifiers/";
    
    % Choosing patient A or B
    if(patient == 1)
        load '../dataset/44202.mat' FeatVectSel Trg
        file_name = file_name + "44202_";
    elseif(patient == 2)
        load '../dataset/63502.mat' FeatVectSel Trg
        file_name = file_name + "63502_";
    end
    
    % Divinding the dataset and target into treino + test
    percentage = 0.85;
    
    breakingIndex = round(length(FeatVectSel) * percentage);
    
    data_treino = FeatVectSel(1:breakingIndex, :);
    target_treino = Trg(1:breakingIndex, :);
    
    P = data_treino';
    T = correctTarget(target_treino);
    T = T';
    size(T)
    %balacing train
    if(hasBalance)
        [P, T] = balanceTrainSet(P, T);  
        file_name = file_name + "B";
    end
    

    %-------------------- DEEP NETS --------------------
    %CNN
    
    [data_4D, target_4D] = ccn_pre_processing(P,  T);
    
    %Defines the pooling of CNN (max or average)
    if (strcmp(Pool, 'max'))
        pooling = maxPooling2dLayer(PoolSize,'Stride',PoolStride);
    elseif (strcmp(Pool, 'average'))
        pooling = averagePooling2dLayer(PoolSize,'Stride',PoolStride);
    end
    file_name = file_name + PoolStride + "_PSize"+ PoolSize + "_PStride" + PoolStride + "_NF" + NumFilters + "_FS"+ FilterSize + "_NL"+ numLayers + "_LS" + layerStride+ "_E"+maxEpochs;

    %defines the number of convulational layers
    if numLayers == 1 || numLayers == 2
        layers = [imageInputLayer([29 29 1]), 
            convolution2dLayer(FilterSize, NumFilters, 'Stride', layerStride,'Padding','same'), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize,NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            fullyConnectedLayer(3), 
            softmaxLayer, 
            classificationLayer];
    elseif numLayers == 3
        layers = [imageInputLayer([29 29 1]), 
            convolution2dLayer(FilterSize, NumFilters, 'Stride', layerStride, 'Padding', 'same'), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize, NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize, NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            fullyConnectedLayer(3), 
            softmaxLayer, 
            classificationLayer];
    elseif numLayers == 4
        layers = [imageInputLayer([29 29 1]), 
            convolution2dLayer(FilterSize,NumFilters,'Stride',layerStride,'Padding','same'), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize,NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize,NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize,NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            fullyConnectedLayer(3), 
            softmaxLayer, 
            classificationLayer];
    elseif numLayers == 5
        layers = [imageInputLayer([29 29 1]), 
            convolution2dLayer(FilterSize,NumFilters,'Stride',layerStride,'Padding','same'), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize,NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize,NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize,NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            pooling, 
            convolution2dLayer(FilterSize,NumFilters), 
            batchNormalizationLayer, 
            reluLayer, 
            fullyConnectedLayer(3), 
            softmaxLayer, 
            classificationLayer];
    end
        
    %Defines the options for training the cnn
    options = trainingOptions('adam', ...
        'Plots','training-progress','Verbose',0, ...
        'MaxEpochs',maxEpochs, ...
        'Shuffle', ...
        'every-epoch', ...
        'InitialLearnRate', 0.01, ...
        'ExecutionEnvironment','cpu');
   
    net = trainNetwork(data_4D, target_4D, layers, options);
    
    save(file_name,"net");
    
end