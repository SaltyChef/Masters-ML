function [sens_previsao1,espec_previsao1,sens_detecao1,espec_detecao1,sens_previsao2,espec_previsao2,sens_detecao2,espec_detecao2] = testCNN(id_pacient, trainedNN)
    filename = strcat(num2str(id_pacient), '.mat');
    load(filename);
    
    [ffRealTrg, ffRealFVS, fRealTrg, fRealFVS] = SetCreation(FeatVectSel, Trg);
    [finalP, finalT] = convolutional_preprocessing(fRealFVS, fRealTrg);
    
    test_results = classify(trainedNN,finalP);
    
    [sens_previsao1,espec_previsao1,sens_detecao1,espec_detecao1] = ConfMatrixMet1CNN(finalT,test_results,'CNN');

    [sens_previsao2,espec_previsao2,sens_detecao2,espec_detecao2] = ConfMatrixMet2CNN(finalT,test_results,'CNN');
     
end

