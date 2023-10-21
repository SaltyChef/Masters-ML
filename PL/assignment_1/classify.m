function res = classify(filterType) 
    
    load models/classifiers/net_purelin_1L.mat
    %load models/classifiers/net_purelin_softmax_2L.mat
    %load models/classifiers/net_purelin_purelin_2L.mat
    %load models/classifiers/net_purelin_logsig_2L.mat
    %--------------------
    %load models/classifiers/net_logsig_1L.mat 
    %load models/classifiers/net_logsig_softmax_2L.mat 
    %load models/classifiers/net_logsig_purelin_2L.mat 
    %load models/classifiers/net_logsig_logsig_2L.mat 
    %--------------------
    %load models/classifiers/net_hardlim_1L.mat

   
    %----------- Filters ----------
    %load models/PerceptronFilter.mat                
    %load models/AssociativeMemoryFilter.mat              
    
    %--------TESTE A -------------
    % load data/testes/PTesteA.mat
    % P=PTesteA
    % f=readmatrix("data/testes/PTesteA.txt");
    %--------TESTE B -------------
    % load data/testes/PTesteB.mat
    % P=PTesteB
    % f=readmatrix("data/testes/PTesteB.txt");
    %--------TESTE C -------------
    load data/testes/PTesteC.mat
    P=PTesteC
    f=readmatrix("data/testes/PTesteC.txt");    
    %--------TREINO --------------
    % load data/treino/gigante.mat
    % P=gigante
    % f=readmatrix("data/treino/gigante.txt");
   


    if(filterType == 1)
        load models/filters/PerceptronFilter.mat
        P2 = sim(netFilter, P);
        resultado = sim(net, P2);
    else
         resultado = sim(net,P);
    end

    view(net);
  
    a = size(resultado);
    [~,ii] = max(resultado);
    res = ii;
    res = reshape(res, [10, a(1,2)/10])';

    res
    res=taxaAcerto(res,f);
    
end