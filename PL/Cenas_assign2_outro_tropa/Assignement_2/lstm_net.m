function net_lstm = lstm_net(P, T, number_neurons)
    target_m = prepare_sets(T);
    [new_p, new_t] = balance_sets(P', target_m);
    [lstm_ready_p, lstm_ready_t] = lstm_preprocessing(new_p, new_t);
    
    network_layers = [sequenceInputLayer(29) lstmLayer(number_neurons, 'OutputMode', 'last')...
        fullyConnectedLayer(3) softmaxLayer classificationLayer];
    options = trainingOptions('adam');
    
    %lstm_ready_t = categorical(lstm_ready_t);
    net_lstm = trainNetwork(lstm_ready_p, lstm_ready_t, network_layers, options);
    save('LSTM', 'net_lstm');
end