%For training use the function net.trainFcn='trainc' and net.adapFcn=’learnp’.
%P -> dataset(256x1700) and T -> Perfect target matrix(256x1700)
function netFilter = create_perceptron(P)
    load PerfectArial.mat
    f = size(P);
    Target = zeros(256, f(1,2));

    for i = 1:f(1,2)
        if(mod(i, 10) == 0) 
            Target(:,i) = Perfect(:,10);
        else
            Target(:,i) = Perfect(:,mod(i,10));

        end
    end
    
    %cria uma net = perceptron
    netFilter = perceptron;                     
    net.numInputs=1;
    net.inputs{1}.size=256;
    
    net.numLayers=1;
    net.layers{1}.size=256;  
    net.trainFcn='trainc';
    net.adaptFcn='learnp';
    netFilter = train(netFilter,P,Target);
    save("models/filters/PerceptronFilter.mat", 'netFilter');
end