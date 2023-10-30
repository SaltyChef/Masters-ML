
net = feedforwardnet(140,'trainscg');
net.layers{1}.transferFcn = 'logsig';
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-8;
net.trainParam.min_grad = 1e-6;
net = train(net,FeatVectSel',Trg','UseParallel','yes','UseGPU','yes');
view(net);
Y=net(FeatVectSel','UseParallel','yes','UseGPU','yes');