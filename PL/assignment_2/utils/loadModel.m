function resultado = loadModel(patient)
    load ../models/classifiers/63502_AUTO_BEW_DELAY_2L_10HN_trainlm_logsig_logsig_softmax.mat;

    
    % Choosing patient A or B
    if(patient == 1)
        load '../dataset/44202.mat' FeatVectSel Trg;
    elseif(patient == 2)
        load '../dataset/63502.mat' FeatVectSel Trg;
    end
    P = FeatVectSel;
    T = correctTarget(Trg);

     % Divinding the dataset and target into treino + test
    [data_treino,data_test,target_treino,target_test] = divideDataset(P,T ,0.85);
    
    % INVERTING P AND T
    data_test = data_test';
    target_test = target_test';

    view(net);
    result = net(data_test);
    [~,result] = max(result);
    [~,target_test] = max(target_test);
    figure(1)
    plot(result);


    [sens_pred, spec_pred, sens_det, spec_det] = confMatrix(result, target_test)
    postProcessing(result, target_test)

end