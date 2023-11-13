% PATIENT : 
%   1 -> 44202.mat
%   2 -> 63502.mat
% HAS BALANCE
%   1 -> yes
%   else -> no
% HAS EW
%   1       -> yes
%   else    -> no
% ARCHITETURE :
%   1 -> deep       -> CNN
%   2 -> deep       -> LSTM
% MAX EPHOCS : 
%   
% POOL SIZE :
%   int (preperencialmente 2)

function resultado = deepClassify(patient, hasBalance, hasEW, architeture, maxEphocs, PoolSize, PoolStride)
    file_name = "../models/classifiers/";

    % Choosing patient A or B
    if(patient == 1)
        load '../dataset/44202.mat' FeatVectSel Trg
        file_name = file_name + "44202_";
    elseif(patient == 2)
        load '../dataset/63502.mat' FeatVectSel Trg
        file_name = file_name + "63502_";
    end
    P = FeatVectSel;
    T = correctTarget(Trg);

    
    % Divinding the dataset and target into treino + test
    percentage = 0.85;
    
    breakingIndex = round(length(P) * percentage);
    data_treino = P(1:breakingIndex, :);
    data_test = P(breakingIndex+1:end , :);
    
    target_treino = T(1:breakingIndex, :);
    target_test = T(breakingIndex+1:end , :);
    
    % INVERTING P AND T
    data_treino = data_treino';
    target_treino = target_treino';
    data_test = data_test';
    target_test = target_test';

    %balacing train
    if(hasBalance == 1)
        %[data_treino, target_treino] = balanceTrainSet(data_treino, target_treino);  
        file_name = file_name + "B";
    end

    %Error weights
    if(hasEW == 1)
        EW = errorWeights(target_treino);
        file_name = file_name + "EW_";
    end


    %-------------------- DEEP NETS --------------------
    %CNN
    if(architeture == 1)
        [data_4D, target_4D] = ccn_pre_processing(data_treino, target_treino);
        %Defines the pooling of CNN (max or average)
        if (strcmp(pool, 'max') == 1)
            pooling = maxPooling2dLayer(PoolSize,'Stride',PoolStride);
        elseif (strcmp(pool, 'average') == 1)
            pooling = averagePooling2dLayer(PoolSize,'Stride',PoolStride);
        end

        %defines the number of convulational layers
        if n_conv == 1 || n_conv == 2
            layers = [imageInputLayer([29 29 1]), 
                convolution2dLayer(FilterSize,NumFilters,'Padding','same'), 
                batchNormalizationLayer, 
                reluLayer, 
                pooling, 
                convolution2dLayer(FilterSize,NumFilters), 
                batchNormalizationLayer, 
                reluLayer, 
                fullyConnectedLayer(2), 
                softmaxLayer, 
                classificationLayer()];
        elseif n_conv == 3
            layers = [imageInputLayer([29 29 1]), 
                convolution2dLayer(FilterSize, NumFilters, 'Stride', LayerStride, 'Padding', 'same'), 
                batchNormalizationLayer, reluLayer, pooling, 
                convolution2dLayer(FilterSize, NumFilters), 
                batchNormalizationLayer, reluLayer, pooling, 
                convolution2dLayer(FilterSize, NumFilters), 
                batchNormalizationLayer, reluLayer, 
                fullyConnectedLayer(2), 
                softmaxLayer, 
                classificationLayer];
        elseif n_conv == 4
            layers = [imageInputLayer([29 29 1]), 
                convolution2dLayer(FilterSize,NumFilters,'Stride',LayerStride,'Padding','same'), 
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
                fullyConnectedLayer(2), 
                softmaxLayer, 
                classificationLayer];
        elseif n_conv == 5
            layers = [imageInputLayer([29 29 1]), 
                convolution2dLayer(FilterSize,NumFilters,'Stride',LayerStride,'Padding','same'), 
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
                fullyConnectedLayer(2), 
                softmaxLayer, 
                classificationLayer];
        end
        
        %Defines the options for training the cnn
        options = trainingOptions(solverName,'Plots','training-progress','Verbose',0,'MaxEpochs',maxEpochs, 'Shuffle', 'every-epoch', 'InitialLearnRate', 0.01, 'ExecutionEnvironment','cpu');
       
        net = trainNetwork(data_4D, target_4D, layers, options);
        save("teste_cnn","net");
    

    elseif(architeture == 2)

    end

end