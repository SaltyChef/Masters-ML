function sigmoidClassifier = sigmoid_classifier(P,T)
net = patternnet([]);
net.layers{1}.transferFcn = 'logsig';
net = train(net, P, T);

sigmoidClassifier = net;
save("sigmoidClassifier.mat", 'sigmoidClassifier');
end

