%For training use the function net.trainFcn='trainc' and net.adapFcn=’learnp’.
function netFilter = create_perceptron(P)
    %cria matrix target
    f=size(P);
    T = createTarget(f(1,2));
   
    netFilter = perceptron;                     %cria uma net = perceptron
    netFilter = configure(netFilter, P, T) 
    netFilter.trainFcn = 'trainc'   
    netFilter.adaptFcn = 'learnp';
    netFilter = train(netFilter,P,T);
    save("models/PerceptronFilter.mat", 'netFilter');