function net_linear = linear_fun(P2, t)
    net_linear = linearlayer;
    net_linear.trainParam.epochs = 1000;
    net_linear = train(net_linear, P2, t);
end

