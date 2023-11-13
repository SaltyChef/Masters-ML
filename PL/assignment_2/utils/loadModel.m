function loadModel(patient, file_name)
    load ../models/classifiers/44202_FF_2L_10HN_trainlm_purelin_purelin.mat;
    
    % Choosing patient A or B
    if(patient == 1)
        load '../dataset/44202.mat' FeatVectSel Trg;
        file_name = file_name + "44202_";
    elseif(patient == 2)
        load '../dataset/63502.mat' FeatVectSel Trg;
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
    
    %balacing train
    % [data_treino, target_treino] = balanceTrainSet(data_treino, target_treino);  

    % INVERTING P AND T
    data_treino = data_treino';
    target_treino = target_treino';
    data_test = data_test';
    target_test = target_test';


    result = net(data_test);
    [~,result] = max(result);
    [~,target_test] = max(target_test);
    view(net);
    [sensitivity_dec, specifit_dec] = detection(result, target_test);
    [sensitivity_pred, specifit_pred] = prediction(result, target_test);

end