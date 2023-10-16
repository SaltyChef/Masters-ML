%P -> 
function resultado=treinoClassifierLinear(P, num_layers)     
    %Create target
    f=size(P);
    T = createTarget(f(1,2));

    %Create default net
    if(num_layers == 1)
        net = patternnet([]);
    else 
        net = patternnet(10);    
    end
    net.layers{1}.size = 151;
    net = configure(net,P,T);
  
    %Train parameters
    net.layers{1}.transferFcn = 'purelin'; %linear
    net.trainFcn='traingd';
    net.trainParam.epochs = 10000;
    net.trainParam.goal = 1e-8;

    net = train(net,P,T);
    view(net);
    resultado = sim(net,P);
    
    if(num_layers == 1)
        save("models/netLinear_1L.mat","net");
    else 
        save("models/netLinear_2L.mat","net");  
    end
end