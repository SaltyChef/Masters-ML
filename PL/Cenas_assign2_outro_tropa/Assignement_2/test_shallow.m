function [sens_previsao1,espec_previsao1,sens_detecao1,espec_detecao1,sens_previsao2,espec_previsao2,sens_detecao2,espec_detecao2] = test_shallow(id_pacient, trainedNN, auto, finalFeats)
    filename = strcat(num2str(id_pacient), '.mat');
    load(filename);
    [ffRealTrg, ffRealFVS, fRealTrg, fRealFVS] = SetCreation(FeatVectSel, Trg);
    if(auto == 1)
      
       autoenc = trainAutoencoder(fRealFVS,finalFeats,'MaxEpochs',200);
       fRealFVS = encode(autoenc, fRealFVS);
   
    end
   
   test_results = sim(trainedNN,fRealFVS);
   [sens_previsao1,espec_previsao1,sens_detecao1,espec_detecao1] = ConfMatrixMet1(fRealTrg,test_results,'shallow');

   [sens_previsao2,espec_previsao2,sens_detecao2,espec_detecao2] = ConfMatrixMet2(fRealTrg,test_results,'shallow');
end

