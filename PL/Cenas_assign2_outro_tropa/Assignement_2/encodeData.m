function [X_encoded] = encodeData(X, finalFeats, maxEpochs)
    autoEncoder = trainAutoEncoder(X, finalFeats, 'MaxEpochs', maxEpochs);
    X_encoded = encode(autoEnconder, X);
end

