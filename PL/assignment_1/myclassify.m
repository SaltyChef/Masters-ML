function res = myclassify(P, filled_inx) 
 
    temp = zeros(256 ,length(filled_inx));
    for i = 1 : length(filled_inx) 
        temp(:,i) = P(:,filled_inx(i));
    end
    P = temp;

    
    file = load("models/TESTE.mat", "net");
    net = file.net;
    noFilter=load("myClassifyArguments/noFilter.mat","noFilter");
    noFilter=noFilter.noFilter;
    
    associativeMemory=load("myClassifyArguments/associativeMemory.mat","associativeMemory");
    associativeMemory=associativeMemory.associativeMemory;

    if (strcmp(noFilter,'Off'))    
        %load filter
        if(strcmp(associativeMemory,'Off'))
            filterFile="models/filters/PerceptronFilter.mat";
        else
            filterFile = "models/filters/AssociativeMemoryFilter.mat"; 
        end
        file = load(filterFile, "netFilter" );
        netFilter = file.netFilter;
        
        view(net);
        P2 = sim(netFilter, P);
        resultado = sim(net, P2);
    else
        view(net);
        resultado = sim(net,P);
    end
   
    
    [~,ii] = max(resultado);
    res = ii;
    a = size(ii);
   
    %res=taxaAcerto(res,f);
end