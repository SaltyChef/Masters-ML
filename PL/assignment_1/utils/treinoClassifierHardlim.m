function resultado = treinoClassifierHardlim(P)
    %create target
    f=size(P);
    T = createTarget(f(1,2));
    
    %train
    net = perceptron;
    net.layers{1}.size = 151;
    net = configure(net, P, T);
    net.layers{1}.transferFcn = 'hardlim'; %binary
    net.trainFcn = 'trainc';
    net.adaptFcn = 'learnp';
    net.trainParam.epochs = 1000;
    net = train(net,P,T);

    view(net);
    resultado = net;
   
    %save("models/classifiers/net_hardlim_1L.mat","net");
     save("models/classifiers/net_hardlim_TESTE.mat","net");
    
end