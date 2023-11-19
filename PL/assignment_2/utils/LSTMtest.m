function resultado = LSTMtest(patient)
    
    load ../models/classifiers/LSTM_63502_B_29F_30H_10Ep.mat;

     % Choosing patient A or B
    if(patient == 1)
        load '../dataset/44202.mat' FeatVectSel Trg
    elseif(patient == 2)
        load '../dataset/63502.mat' FeatVectSel Trg
    end

    XTrain=FeatVectSel;
    YTrain=correctTarget2(Trg);
    % YTrain=T;

    percentage = 0.85;
    
    breakingIndex = round(length(XTrain) * percentage);
    data_test = XTrain(breakingIndex+1:end , :);
    
    target_test = YTrain(breakingIndex+1:end , :);
    
    data_test=num2cell(data_test',1);
  
    target_test=categorical(target_test);

    result = classify(net, data_test);
     
    target = grp2idx(target_test)';
    result = grp2idx(result)';


    [sens_pred, spec_pred, sens_det, spec_det] = confMatrix(result, target)
    postProcessing(result, target)