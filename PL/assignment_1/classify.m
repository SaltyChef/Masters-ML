function res = classify() 
    
    %load models/classifiers/net_purelin_1L.mat 
    %  TESTE A  80%    1000 ephocs   10 hidden    1e-8 perfor  1e-6 grad
    %  TESTE B  88%     "               " 
    %  TESTE C  92%     "               "
    %  TREINO 
    %--------------------
    load models/classifiers/net_purelin_logsig_2L.mat
    %  TESTE A 80%    1000 ephocs   10 hidden     1e-8 perfor  1e-6 grad
    %  TESTE B 84%    "                 "
    %  TESTE C 88%
    %  TREINO 
    %--------------------
    %load models/classifiers/net_purelin_softmax_2L.mat 
    %  TESTE A 90%    10000 ephocs   138 hidden     1e-8 perfor  1e-6 grad
    %  TESTE B 90%      "               "
    %  TESTE C 88%      "               "
    %  TREINO 
    %--------------------
    %load models/classifiers/net_purelin_softmax_2L.mat 
    %  TESTE A 90%    10000 ephocs   138 hidden     1e-8 perfor  1e-6 grad
    %  TESTE B 90%      "               "
    %  TESTE C 88%      "               "
    %  TREINO 
    %--------------------
    


   
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

   
    view(net);
    resultado = sim(net,P);
   
    [~,ii] = max(resultado);
    res = ii;
    res = reshape(res, [10, 5])';
  
    res=taxaAcerto(res,f);
end