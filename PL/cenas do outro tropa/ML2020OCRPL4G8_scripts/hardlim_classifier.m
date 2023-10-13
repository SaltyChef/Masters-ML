function hardlimClassifier = hardlim_classifier(P, T)
    netP = perceptron;
    netP = configure(netP,P,T);
    netP.trainFcn = 'trainc';
    netP.adaptFcn = 'learnp';
    netP.trainParam.epochs = 1000;
    netP = train(netP,P,T);
    hardlimClassifier = netP;
    save("hardlimClassifier.mat", 'hardlimClassifier')

end

