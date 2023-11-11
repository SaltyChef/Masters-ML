function result = trainDelays(P, T)
    T = correctTarget(T);
    size(P)
    size(T)

    net = layrecnet(1:2,10,'trainlm')
    

    P = P';
    T = T';

    [Xs,Xi,Ai,Ts] = preparets(net,P(2,:),T');
    net = train(net,Xs,Ts,Xi,Ai);
    view(net);
    result = net(Xs,Xi,Ai);

    perf = perform(net,Y,Ts)

    save("models/classifiers/net_nn_basic.mat", result);
end