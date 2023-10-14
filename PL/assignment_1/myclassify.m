function res = myclassify(P) 
    load net.mat;
    f=readmatrix("printTest.txt");
    resultado = sim(net,P);
    [~,ii] = max(resultado);
    res = ii;
    res = reshape(res, [10, 5])';
    res
    f
    res=taxaAcerto(res,f);
end