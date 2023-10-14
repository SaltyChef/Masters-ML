%For training use the function net.trainFcn='trainc' and net.adapFcn=’learnp’.
function netFilter = create_perceptron(P, T)
    netFilter = perceptron;                     %cria uma net = perceptron
    netFilter = configure(netFilter, P, T) 
    netFilter.trainFcn = 'trainc'   
    netFilter.adaptFcn = 'learnp';
    netFilter = train(netP,P,T);
    save("PerceptronFilter.mat", 'netFilter');