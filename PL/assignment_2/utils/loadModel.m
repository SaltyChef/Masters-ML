function resultado = loadModel(patient)
    load ../models/classifiers/44202_AUTO_BEW_DELAY_1L_10HN_trainlm_purelin_softmax.mat;

    
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
   
    [sens_pred_1, spec_pred_1, sens_det_1, spec_det_1] = confMatrix(result, target_test)
    [sens_pred_2, spec_pred_2, sens_det_2, spec_det_2]=postProcessing(result, target_test)
end