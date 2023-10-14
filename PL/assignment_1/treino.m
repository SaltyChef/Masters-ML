function resultado=treino(P,True)     

    f=size(P);

    T = createTarget(f(1,2));
 
    net = feedforwardnet(10);
    net = configure(net,P,T);
    
    net.layers{1}.transferFcn = 'logsig';
    net.trainFcn='traingd';
    net.trainParam.epochs = 100000;
    net.trainParam.goal = 1e-8;
    % net.trainParam.mu_max=10;
    % net.trainParam.max_fail=100;
    view(net);

    net = train(net,P,T);
    
    resultado = sim(net,P);
    save("net.mat","net");
end