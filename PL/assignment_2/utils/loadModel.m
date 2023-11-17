function loadModel(patient, architeture)
    load ../models/classifiers/44202_1_1_1_15_10_3_1_100.mat;
    
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

    %FF e delay
    if(architeture == 1)   
        view(net);
        result = net(data_test);
        [~,result] = max(result);
        [~,target_test] = max(target_test);
        [sensitivity_dec, specifit_dec] = detection(result, target_test);
        [sensitivity_pred, specifit_pred] = prediction(result, target_test);
    else(architeture == 2)
        [data_4D, target_4D] = ccn_pre_processing(data_test, target_test);
        result = classify(net, data_4D);
        [sensitivity_dec, specifit_dec] = detection2(result, target_4D);
        [sensitivity_pred, specifit_pred] = prediction2(result, target_4D);
    end
end