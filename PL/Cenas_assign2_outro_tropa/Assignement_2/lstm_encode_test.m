function [lstm_ready_p, lstm_ready_t] = lstm_encode_test(P, T, autoencoder_features, max_epochs)
    [autoencoder_ready_p, ~] = lstm_preprocessing(P, T);
    
    autoencoder = trainAutoencoder(autoencoder_ready_p, autoencoder_features, 'MaxEpochs', max_epochs);
    autoencoder_ready_p = encode(autoencoder, autoencoder_ready_p);
    
    [lstm_ready_p, lstm_ready_t] = lstm_preprocessing(autoencoder_ready_p, T);
end