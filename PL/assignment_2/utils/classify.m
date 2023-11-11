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
% TRAIN FUN:
%   if traningStyle == 1(Incremental):
%       trainFun:
%           trainc
%           trainr
%           LEARN FUN:
%              learngd
%              learngdm
%   
%   if trainingStyle == 2(batch):
%       trainFun:
%           traingd
%           traingdm
%           trainlm
%

function result = classify(patient, architeture, trainingStyle, trainFun, learnFun, numLayers, actFun1, actFun2, actFun3, numHiddenNeurons)
    file_name = "";

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

    %balacing train



    %-------------------- SHALLOW NETS -------------------- 
    if(architeture == 1 || architeture == 2)
        hiddenLayers = (1:numLayers);
        hiddenLayers(1,:) = numHiddenNeurons;
        
        if(architeture == 1)
            net = feedforwardnet(hiddenLayers , trainFun);
            file_name = file_name + "FF_" + numLayers + "L_" + numHiddenNeurons + "HN_" + trainFun + "_";
        elseif(architeture == 2)
            net = layrecnet(1:2 , hiddenLayers , trainFun);
            file_name = file_name + "DELAY_" + numLayers + "L_" + numHiddenNeurons + "HN_" + trainFun + "_";
        end
        
        if(trainingStyle == 1)
            net.adaptFcn = learnFun;
            file_name = file_name + learnFun + "_";
        end

        %activation 
        if(numLayers == 1)
            net.layers{1}.transferFcn = actFun1;
            file_name = file_name + actFun1;
        elseif(numLayers == 2)
            net.layers{1}.transferFcn = actFun1;
            net.layers{2}.transferFcn = actFun2;
            file_name = file_name + actFun1 + "_" + actFun2;
        elseif(numLayers == 3)
            net.layers{1}.transferFcn = actFun1;
            net.layers{2}.transferFcn = actFun2;
            net.layers{3}.transferFcn = actFun3;
            file_name = file_name + actFun1 + "_" + actFun2 + "_" + actFun3;
        end
        
        file_name = file_name + ".mat"
        
        net = train(net, data_treino, target_treino);
        result = net(data_test);
        perf = perform(net,data_test,target_test)

    %-------------------- DEEP NETS --------------------
    elseif(architeture == 3)

    elseif(architeture == 4)


    end


end
