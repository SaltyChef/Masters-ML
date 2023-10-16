function resultado=treino(P, tranfesFunc,trainFunc,ephocs,goal)     
    f=size(P);

    T = createTarget(f(1,2));
 
    net = feedforwardnet(10);
    net = configure(net,P,T);
    
    net.layers{1}.transferFcn = tranfesFunc;
    net.trainFcn=trainFunc;
    net.trainParam.epochs = ephocs;
    net.trainParam.goal =goal;

    net = train(net,P,T);
    
    resultado = sim(net,P);
    save("models/TESTE.mat","net");
end