function resultado = LSTMtest(P,T)
    
    load LSTM.mat;

    XTrain=P;
    YTrain=correctTarget2(T);
    % YTrain=T;

    percentage = 0.85;
    
    breakingIndex = round(length(XTrain) * percentage);
    data_test = XTrain(breakingIndex+1:end , :);
    
    target_test = YTrain(breakingIndex+1:end , :);
    
    data_test=num2cell(data_test',1);
  
    target_test=categorical(target_test);

    result = classify(net, data_test);

    [sens_pred, spec_pred, sens_det, spec_det] = confMatrix(result, target_test)