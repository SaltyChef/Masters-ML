% PATIENT : 
%   1 -> 44202.mat
%   2 -> 63502.mat
% ARCHITETURES :
%   shallow -> tansig, purelin, sigmoidal ... softmax
%   1 -> shallow    -> feedfowardnet 
%   2 -> shallow    -> layrecnet (layer Recurrent Network) with delays
%   3 -> deep       -> CNN
%   4 -> deep       -> LSTM
% TRAINING STYLE:
%   1 -> incremental learning 
%   2 -> batch learning

function result = classify(patient, architeture, trainingStyle, numLayers, numHiddenNeurons)
    % Choosing patient A or B
    
    if(patient == 1)
        load '../dataset/44202.mat' FeatVectSel Trg
    elseif(patient == 2)
        load '../dataset/63502.mat' FeatVectSel Trg
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

    %% SHALLOW NETS 
    
    %feedfowardnet
    if(architeture == 1)
        net = feedforwardnet(numHiddenNeurons);
        
        if(trainingStyle == 1)
            net.trainFcn = 'trainc';
            net.adaptFcn = 'learnp';
        elseif(trainingStyle == 2)
            net.trainFcn = 'trainlm';    
        end

        net = train(net, data_treino, target_treino);
        
        result = net(data_test);
        
        perf = perform(net,data_test,target_test)

    elseif(architeture == 2)
            
    


    %% DEEP NETS
    elseif(architeture == 3)

    elseif(architeture == 4)


    end


end
