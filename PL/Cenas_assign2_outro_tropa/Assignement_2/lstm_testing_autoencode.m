function [sens_previsao1,espec_previsao1,sens_detecao1,espec_detecao1,sens_previsao2,espec_previsao2,sens_detecao2,espec_detecao2] = lstm_testing_autoencode(P_Test, T_Test, net_lstm)
    t_test = prepare_sets(T_Test);
    
    [new_p, new_t] = lstm_encode_test(P_Test, t_test, autoencoder_features, m);
    
    result = classify(net_lstm, new_p);
    
    [sens_previsao1,espec_previsao1,sens_detecao1,espec_detecao1] = ConfMatrixMet1(new_t,result,'LSTM');

   [sens_previsao2,espec_previsao2,sens_detecao2,espec_detecao2] = ConfMatrixMet2(new_t,result,'LSTM');
end