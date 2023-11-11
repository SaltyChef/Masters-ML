function net_lstm = lstm_autoencoder(P, T, autoencoder_features, max_epochs, number_neurons)
    target_m = prepare_sets(T);
    [new_p, new_t] = balance_sets(P', target_m);
    
    [autoencoder_ready_p, ~] = lstm_preprocessing(new_p, new_t);
    
    autoencoder = trainAutoencoder(autoencoder_ready_p, autoencoder_features, 'MaxEpochs', max_epochs);
    autoencoder_ready_p = encode(autoencoder, autoencoder_ready_p);
    
    [lstm_ready_p, lstm_ready_t] = lstm_preprocessing(autoencoder_ready_p, new_t);
    
    %sequenceInputLayer -> value used for autoencoder
    %lstmLayer -> specify number of neurons
    network_layers = [sequenceInputLayer(autoencoder_features) lstmLayer(number_neurons, 'OutputMode', 'last')...
        fullyConnectedLayer(3) softmaxLayer classificationLayer];
    options = trainingOptions('adam');
    
    %lstm_ready_t = categorical(lstm_ready_t);
    net_lstm = trainNetwork(lstm_ready_p, lstm_ready_t, network_layers, options);
    save('LSTM', 'net_lstm');
end