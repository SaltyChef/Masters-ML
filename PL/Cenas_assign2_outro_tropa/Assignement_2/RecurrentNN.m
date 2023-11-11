function rNN = RecurrentNN(T, X, nnlayers, neurons, trainFunc, transferFunc, auto, finalFeats)
    
    [fRealTrg, fRealFVS, NA, NA2] = SetCreation(X, T);
    
    %Detects if autoencoder mus tbe used
    if(auto == 1)
        fRealFVS = encodeData(fRealFVS, finalFeats, 200);
    end
    
    neurons = neurons(1:nnlayers);
    layerDelays = 1:2;
    
    rNN = layrecnet(layerDelays,neurons, trainFunc);
    
    %define layers of nn based on the number defined by the user
    if nnlayers == 1
        rNN.numLayers = 2;
        rNN.layers{1}.transferFcn = transferFunc{1};
    elseif nnlayers == 2
        rNN.numLayers = 3;
        rNN.layers{1}.transferFcn = transferFunc{1};
        rNN.layers{2}.transferFcn = transferFunc{2};
    elseif nnlayers == 3
        rNN.numLayers = 4;
        rNN.layers{1}.transferFcn = transferFunc{1};
        rNN.layers{2}.transferFcn = transferFunc{2};
        rNN.layers{3}.transferFcn = transferFunc{3};
    else
        rNN.numLayers = 2;
        rNN.layers{1}.transferFcn = transferFunc{1};
    end
    
    
    %Train Parameters
    rNN.trainParam.epochs = 1000;
    rNN.trainParam.min_grad = 10e-9;
    rNN.trainParam.lr = 0.01;
    rNN.performFcn = 'msereg';
    rNN.trainParam.max_fail = 100;
    rNN.trainParam.goal = 1e-9;
    
    
    %Divide the set for training and for validation
    rNN.divideParam.trainRatio = 0.85;
    rNN.divideParam.valRatio = 0.15;
    
    %Get dimension of each class
    dimInter = nnz(find(all(fRealTrg==[1 0 0]')));
    dimPreictal = nnz(find(all(fRealTrg==[0 1 0]')));
    dimIctal = nnz(find(all(fRealTrg==[0 0 1]')));
    dimTotal = dimInter + dimPreictal + dimIctal;
    
    %Define weight vector based on dimension of each class, smallest class gets the highest weight 
    pInter = dimTotal/dimInter;
    pPre = dimTotal/dimPreictal;
    pIctal = dimTotal/dimIctal;
    EW = all(fRealTrg==[1 0 0]')*pInter + all(fRealTrg==[0 1 0]')*pPre + all(fRealTrg==[0 0 1]')*pIctal;
    
    %Use GPU for better performance, since it takes a while to finish
    rNN = train(rNN,fRealFVS,fRealTrg,[],[],EW,'UseParallel','yes','UseGPU','yes');
   
   save ('RNN', 'rNN');
    
end

