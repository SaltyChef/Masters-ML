               %FFNN(T, P, a,          b,          c,         d,         0,      0);
%function ffNN = FFNN(T, X, nnlayers, neurons, trainFunc, transferFunc, auto, finalFeats)


    nnlayers = 1 ;
    neurons = 3 ;
    trainFunc = 'trainscg';
    transferFunc = {'purelin'};
    AutoEnconderNeed = 0;
    finalFeats = 0;
    [fRealTrg, fRealFVS, NA, NA2] = SetCreation( FeatVectSel, Trg);
    
    %Detects if autoencoder must tbe used
    if(AutoEnconderNeed == 1)
        fRealFVS = encodeData(fRealFVS, finalFeats, 200);
    end
  
    neurons = neurons(1:nnlayers);
    ffNN = feedforwardnet(neurons,trainFunc);
    
    %define layers of nn based on the number defined by the user
    if nnlayers == 1
        ffNN.numLayers = 2;
        ffNN.layers{1}.transferFcn = transferFunc{1};       
    elseif nnlayers == 2
        ffNN.numLayers = 3;
        ffNN.layers{1}.transferFcn = transferFunc{1};
        ffNN.layers{2}.transferFcn = transferFunc{2};
    elseif nnlayers == 3
        ffNN.numLayers = 4;
        ffNN.layers{1}.transferFcn = transferFunc{1};
        ffNN.layers{2}.transferFcn = transferFunc{2};
        ffNN.layers{3}.transferFcn = transferFunc{3};
    else
        ffNN.numLayers = 2;
        ffNN.layers{1}.transferFcn = transferFunc{1};               
    end
    
    
    %Train Parameters
    ffNN.trainParam.epochs = 1000;
    ffNN.trainParam.min_grad = 10e-9;
    ffNN.trainParam.lr = 0.01;
    ffNN.performFcn = 'msereg';
    ffNN.trainParam.max_fail = 100;
    ffNN.trainParam.goal = 1e-9;
    
    %Divide the set for training and for validation
    ffNN.divideParam.trainRatio = 0.85;
    ffNN.divideParam.valRatio = 0.15;
    
    %Get dimension of each class
    dimInter = nnz(find(all(fRealTrg==[1 0 0]')));     %vai buscar o numero de 1s posicionados mais a esquerda + os no centro + os da direita
    dimPreictal = nnz(find(all(fRealTrg==[0 1 0]')));
    dimIctal = nnz(find(all(fRealTrg==[0 0 1]')));
    dimTotal = dimInter + dimPreictal + dimIctal;
    
    %Define weight vector based on dimension of each class, smallest class gets the highest weight  
    pInter = dimTotal/dimInter;
    pPre = dimTotal/dimPreictal;transferFunc
    pIctal = dimTotal/dimIctal;
    EW = all(fRealTrg==[1 0 0]')*pInter + all(fRealTrg==[0 1 0]')*pPre + all(fRealTrg==[0 0 1]')*pIctal;
    
    %Use GPU for better performance, since it takes a while to finish
    ffNN = train(ffNN,fRealFVS,fRealTrg,[],[],EW,'UseParallel','yes','UseGPU','yes');
    
    save ('FFNN', 'ffNN');
%end

