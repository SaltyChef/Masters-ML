function [sens_previsao1,espec_previsao1,sens_detecao1,espec_detecao1,sens_previsao2,espec_previsao2,sens_detecao2,espec_detecao2] = lstm_testing(P_Test, T_Test, net_lstm)
    t_test = prepare_sets(T_Test);
    
    [lstm_ready_p, lstm_ready_t] = lstm_preprocessing(P_Test', t_test);
    
    result = classify(net_lstm, lstm_ready_p);
    
    [sens_previsao1,espec_previsao1,sens_detecao1,espec_detecao1] = ConfMatrixMet1(lstm_ready_t, result,'LSTM');

   [sens_previsao2,espec_previsao2,sens_detecao2,espec_detecao2] = ConfMatrixMet2(lstm_ready_t,result,'LSTM');
end