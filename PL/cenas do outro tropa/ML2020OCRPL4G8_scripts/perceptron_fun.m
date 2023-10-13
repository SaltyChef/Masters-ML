function netP = perceptron_fun(P, T)
    netP = perceptron;
    netP = configure(netP,P,T);
    netP.trainFcn = 'trainc';
    netP.adaptFcn = 'learnp';
    netP.trainParam.epochs = 1000;
    netP = train(netP,P,T);
    save("PerceptronFilter.mat", 'netP')
end
