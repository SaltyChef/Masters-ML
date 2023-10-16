function res = myclassify(P, hasFilter, filterName) 
    
    % --------- -----------                         %       epochs
    %load models/netLinear_traingd.mat              %66     500000
    %load models/netLinear_trainscg.mat             %62      10000
    %load models/netLinear_traingdm.mat             %14      10000
    %load models/netLinear_trainlm.mat              %58      10000
    %load models/netLinear_traingda.mat             %28      10000
    %load models/netLinear_traingd_2L.mat           %50      10000
    % ------------------------
    %load models/netBinary_traingd.mat              %18      10000
    %load models/netBinary_traingda.mat             %22      10000
    %load models/netBinary_trainscg.mat             %12      10000
    %load models/netBinary_traingdm.mat             %8       10000
    %load models/netBinary_trainlm.mat              %10      10000
    %-------------------------
    %load models/netSigmoidal_traingd.mat           %36      10000
    %load models/netSigmoidal_traingda.mat          %42      10000
    %load models/netSigmoidal_trainscg.mat          %70      10000
    %load models/netSigmoidal_traingdm.mat          %36      10000
    %load models/netSigmoidal_trainlm.mat           %56      10000
    %----------- Filters ----------
    %load models/PerceptronFilter.mat                
    %load models/TESTE.mat                          %22      10000
    
    %load model
    file = load("models/TESTE.mat", "net");
    net = file.net;


    if hasFilter     
        %load filter
        filterFile = "models/" + filterName + ".mat";
        file = load(filterFile, "netFilter" );
        netFilter = file.netFilter;
        P2 = sim(netFilter, P);
        resultado = sim(net, P2);
    else
        resultado = sim(net,P);
    end
    


    %f=readmatrix("printTest.txt");

    [~,ii] = max(resultado);
    res = ii;
    res = reshape(res, [10, 5])';
  
    %res=taxaAcerto(res,f);
end