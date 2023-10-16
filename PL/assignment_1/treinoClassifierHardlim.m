function resultado = treinoClassifierHardlim(P, num_layers)
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
    if(num_layers == 1)
        save("models/netHardlim_1L.mat","net");
    else 
        save("models/netLinear_2L.mat","net");  
    end

end