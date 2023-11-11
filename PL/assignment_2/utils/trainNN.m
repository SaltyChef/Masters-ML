function result = trainNN(P, T)
    T = correctTarget(T);
    size(P)
    size(T)
   
     net = feedforwardnet(10);
     net = train(net,P',T');
     view(net)


     result = net(P');


     perf = perform(net,P,T)
    save("models/classifiers/net_nn_basic.mat", result);
end