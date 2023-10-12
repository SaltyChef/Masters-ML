function resultado = myclassify(P, filled_inx) 

    W=rand(10,256); %generates matrix 10x256 random in (0 1)
    b=rand(10,1);
    a = 1
    % To initialize W and b randomly in the interval (a,b)
    W=a+(b-a).*rand(10,256)
    b=a + (b-a).*rand(10,1);
    net.IW{1,1}=W;
    net.b{1,1}= b;
   
    %Training parameters
    net.performParam.lr = 0.5; % learning rate
    net.trainParam.epochs = 1000; % maximum epochs
    net.trainParam.show = 35; % show
    net.trainParam.goal = 1e-6; % goal=objective
    net.performFcn = 'sse'; % criterion
    
    %Training
    
    
    T = createTarget(length(P(1)))

    net = train(net,P,T);
    W = net.IW{1,1};
    b = net.b{1,1};

    a = sim(net,Pt)
end