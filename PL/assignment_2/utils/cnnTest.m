%funçao que testa o modelo de CNN
function resultado = cnnTest(P, T)
    
    load ../models/classifiers/44202_1_PSize1_PStride1_NF15_FS10_NL2_LS1_E100.mat;

    % Divinding the dataset and target into treino + test
    [data_treino,data_test,target_treino,target_test] = divideDataset(P,T ,0.85);
    
    target_test = correctTarget(target_test);
    
    % INVERTING P AND T
    data_test = data_test';
    target_test = target_test';

    [data_4D_test, target_4D_test] = ccn_pre_processing(data_test,  target_test);

    result = classify(net, data_4D_test);
    
    target = grp2idx(target_4D_test)';
    result = grp2idx(result)';
    
    [sens_pred, spec_pred, sens_det, spec_det] = confMatrix(result, target)

end