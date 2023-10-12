function res = myclassify(P, filled_inx) 
    load net.mat;
    % % W=rand(10,256); %generates matrix 10x256 random in (0 1)
    % % b=rand(10,1);     
    % a =0;
    % c=1;
    % % To initialize W and b randomly in the interval (a,c)
    % W=a+(c-a).*rand(10,256);
    % b=a + (c-a).*rand(10,1);
    % net.IW{1,1}=W;
    % net.b{1,1}= b;
    % 
    % %Training parameters
    % net.performParam.lr = 0.5; % learning rate
    % net.trainParam.epochs = 1000; % maximum epochs
    % net.trainParam.show = 35; % show
    % net.trainParam.goal = 1e-6; % goal=objective
    % net.performFcn = 'sse'; % criterion
    % 
    % %Training
    % 
    % f=size(P);
    % T = createTarget(f(1,2));
    % net = feedforwardnet(10);
    % net1 = configure(net,P,T);
    % net2 = train(net1,P,T);
    % W = net.IW{1,1};
    % b = net.b{1,1};
    
    resultado = sim(net2,P);

    [~,ii] = max(resultado);
    res = ii;
    res = reshape(res, [10, 5])';
end