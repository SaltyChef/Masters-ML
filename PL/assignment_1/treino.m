function resultado=treino(P,True)     
    %Create target
    f=size(P);
    T = createTarget(f(1,2));

    %Create default net
    net = feedforwardnet(10);
    net = configure(net,P,T);

    %train
    %net.layers{1}.transferFcn = 'hardlim'; %binary
    %net.layers{1}.transferFcn = 'logsig'; %sigmoidal
    net.layers{1}.transferFcn = 'purelin'; %linear
    
    
    net.trainFcn='traingd';
    %net.trainFcn='traingda';
    %net.trainFcn='trainscg';
    %net.trainFcn='traingdm';
    %net.trainFcn='trainlm';
    
    %Train parameters
    net.trainParam.epochs = 10000;
    net.trainParam.goal = 1e-8;
    % net.trainParam.max_fail=100;      %validation 
   
    net = train(net,P,T);
    
    resultado = sim(net,P);
    save("models/TESTE.mat","net");
end