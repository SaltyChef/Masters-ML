function softmaxClassifier = softmax_classifier(P,T)
net = network;
net.numInputs = 1;
net.input.size=256;
net.numLayers = 1;

net.layers{1}.size = 10;
net.inputConnect(1) = 1;
net.biasConnect(1) = 1;
net.outputConnect(1) = 1;

net.layers{1}.transferFcn = 'softmax';

W = rand(10,256);
b = rand(10,1);
net.IW{1,1} = W;
net.b{1,1} = b;
net.trainFcn = 'trainlm';


net = train(net,P,T)

softmaxClassifier = net;
save("softmaxClassifier.mat", 'softmaxClassifier');
end

