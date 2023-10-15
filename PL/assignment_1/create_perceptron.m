%For training use the function net.trainFcn='trainc' and net.adapFcn=’learnp’.
function netFilter = create_perceptron(P)
    load PerfectArial.mat
    Perfect;
    f = size(P);
    Target = zeros(256, f(1,2))
    
    for i = 1:f(1,2)
        if(mod(i, 10)) == 0 
            Target(:,i) = Perfect(:,10);
        else
            Target(:,i) = Perfect(:,mod(i,10));
    
        end
    end
        

    netFilter = perceptron;                     %cria uma net = perceptron
    netFilter = configure(netFilter, P, Target) 
    netFilter.trainFcn = 'trainc'   
    netFilter.adaptFcn = 'learnp';
    netFilter = train(netFilter,P,Target);
    save("models/PerceptronFilter.mat", 'netFilter');