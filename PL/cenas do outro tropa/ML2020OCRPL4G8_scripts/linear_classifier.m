function linearClassifier = linear_classifier(P,T)
net = network;
net.numInputs = 1;
net.input.size=256;
net.numLayers = 1;


net.layers{1}.size = 10;
net.inputConnect(1) = 1;
net.biasConnect(1) = 1;
net.outputConnect(1) = 1;

net.layers{1}.transferFcn = 'purelin';

W = rand(10,256);
b = rand(10,1);
net.IW{1,1} = W;
net.b{1,1} = b;


net.performParam.lr = 0.5;
net.trainParam.epochs = 1000;
net.trainParam.show = 35;
net.trainParam.goal = 1e-6;
net.performFcn = 'mse';
net.trainFcn = 'traingd';
net = train(net,P,T)

linearClassifier = net;
save("linearClassifier.mat", 'linearClassifier');
end
