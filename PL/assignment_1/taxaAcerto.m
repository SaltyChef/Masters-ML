function resultado=taxaAcerto(res, f)
a=size(res)
acertos=0;
total=a(1,1)*a(1,2);
for i=1:a(1,1)
    for j=1:a(1,2)
        if(res(i,j)==f(i,j))
            acertos=acertos+1;
        end
    end
end
resultado=100*(acertos/total);
end