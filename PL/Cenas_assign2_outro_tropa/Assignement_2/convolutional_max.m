function cNN = convolutional_max(T, P, solverName, maxEpochs, n_conv, NumFilters, FilterSize, LayerStride, pool, PoolSize, PoolStride)
    [fRealTrg, fRealFVS, NA, NA2] = SetCreation(P, T);
    [finalP, finalT] = convolutional_preprocessing(fRealFVS, fRealTrg);
    
    %Defines the pooling of CNN (max or average)
    if (strcmp(pool, 'max')==1)
        pooling = maxPooling2dLayer(PoolSize,'Stride',PoolStride);
    elseif (strcmp(pool, 'average')==1)
        pooling = averagePooling2dLayer(PoolSize,'Stride',PoolStride);
    end
    
    %defines the number of convulational layers
    if n_conv == 1 || n_conv == 2
        layers = [imageInputLayer([29 29 1]), convolution2dLayer(FilterSize,NumFilters,'Stride',LayerStride,'Padding','same'), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, fullyConnectedLayer(2), softmaxLayer, classificationLayer];
    elseif n_conv == 3
        layers = [imageInputLayer([29 29 1]), convolution2dLayer(FilterSize,NumFilters,'Stride',LayerStride,'Padding','same'), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, fullyConnectedLayer(2), softmaxLayer, classificationLayer];
    elseif n_conv == 4
        layers = [imageInputLayer([29 29 1]), convolution2dLayer(FilterSize,NumFilters,'Stride',LayerStride,'Padding','same'), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, fullyConnectedLayer(2), softmaxLayer, classificationLayer];
    elseif n_conv == 5
        layers = [imageInputLayer([29 29 1]), convolution2dLayer(FilterSize,NumFilters,'Stride',LayerStride,'Padding','same'), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, pooling, convolution2dLayer(FilterSize,NumFilters), batchNormalizationLayer, reluLayer, fullyConnectedLayer(2), softmaxLayer, classificationLayer];
    end
    
    %Defines the options for training the cnn
    options = trainingOptions(solverName,'Plots','training-progress','Verbose',0,'MaxEpochs',maxEpochs, 'Shuffle', 'every-epoch', 'InitialLearnRate', 0.01, 'ExecutionEnvironment','cpu');
   
    cNN = trainNetwork(finalP, finalT, layers, options);
    save('CNN','cNN');

end