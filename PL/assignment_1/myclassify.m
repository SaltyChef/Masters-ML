function res = myclassify(P) 
    %                                               %       ephocs
    %models/netLinear_1L.mat                        10%     10000
    %models/netLinear_2L.mat                        72%     10000
    %models/netHardlim_1L.mat                       60%     10000
    %models/netSigmoid_1L.mat                       12%     10000
    %models/netSigmoid_2L.mat                       58%     10000
    %----------- Filters ----------
    %load models/PerceptronFilter.mat                
    %load models/AssociativeMemoryFilter.mat              
    
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
    f=readmatrix("printTest.txt");

    [~,ii] = max(resultado);
    res = ii;
    res = reshape(res, [10, 5])';
  
    res=taxaAcerto(res,f);
end