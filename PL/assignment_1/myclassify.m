function res = myclassify(P, filled_inx) 
    %P = P(filled_inx);

    % filename = "models/"+ modelName + ".mat";
    file = load("models/TESTE.mat", "net");
    net = file.net;
    noFilter=load("myClassifyArguments/noFilter.mat","noFilter");
    noFilter=noFilter.noFilter;
    % perceptron=load("perceptron.mat","perceptron");
    % perceptron=perceptron.perceptron;
    associativeMemory=load("myClassifyArguments/associativeMemory.mat","associativeMemory");
    associativeMemory=associativeMemory.associativeMemory;
    if (strcmp(noFilter,'Off'))    
        %load filter
        if(strcmp(associativeMemory,'Off'))
            filterFile="models/PerceptronFilter.mat";
        else
            filterFile = "models/AssociativeMemoryFilter.mat";
        end
        file = load(filterFile, "netFilter" );
        netFilter = file.netFilter;
        netFilter.inputs{1}.size
        
        P2 = sim(netFilter, P);
        resultado = sim(net, P2);
    else
        view(net);
        resultado = sim(net,P);
    end
   
    [~,ii] = max(resultado);
    res = ii;
    res = reshape(res, [10, 5])';
  
    %res=taxaAcerto(res,f);
end