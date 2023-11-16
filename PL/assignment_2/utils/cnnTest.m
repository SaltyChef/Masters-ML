function resultado = cnnTest(P, T)
    
    load ../models/classifiers/44202_1_PSize1_PStride1_NF15_FS10_NL2_LS1_E100.mat;

    % Divinding the dataset and target into treino + test
    percentage = 0.85;
    
    breakingIndex = round(length(P) * percentage);
    data_test = P(breakingIndex+1:end , :);
    target_test = T(breakingIndex+1:end , :);
    
    % INVERTING P AND T
    data_test = data_test';
    target_test = correctTarget(target_test);
    target_test = target_test';

    [data_4D_test, target_4D_test] = ccn_pre_processing(data_test,  target_test);

    result = classify(net, data_4D_test);
    
    % confusionMatrix = confusionmat(target_4D_test,result);  
    % confusionchart(confusionMatrix)


    target = grp2idx(target_4D_test)';
    result = grp2idx(result)';
    
    [sens_pred, spec_pred, sens_det, spec_det] = confMatrix(result, target)

end