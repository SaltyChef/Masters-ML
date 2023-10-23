function resultado = treinoClassifierSigmoid(P, num_layers, fun2)
    %Create target
    f=size(P);
    T = createTarget(f(1,2));

    %Create default net
    if(num_layers == 1)
        net = patternnet([]);
    else 
        net = patternnet(10);    
    end
    %net.layers{1}.size = 151;
    net = configure(net,P,T);
  
    %Train parameters
    net.layers{1}.transferFcn = 'logsig'; %logsig
    if(num_layers == 2)
        if(fun2 == "softmax")
        else
            net.layers{2}.transferFcn = fun2;
        end
        
    end
    %net.trainFcn='traingdx';
    net.trainFcn='trainlm'
    net.trainParam.epochs = 1000;
    net.trainParam.goal = 1e-8;
    net.trainParam.min_grad = 1e-6;

    net = train(net,P,T);
    view(net);
    resultado = sim(net,P);
  
   
    if(num_layers == 1)
        string = "models/classifiers/net_logsig_" + num_layers + "L"+".mat";
        save(string,"net");
    else 
        string = "models/classifiers/net_logsig_" + fun2 + "_" +num_layers + "L"+".mat";
        save(string,"net");  
    end

end