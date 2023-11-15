function  resultado= correctTarget2(T)
controle = [];
valido=1;
for i=1:length(T)
    if(T(i)==1 && valido)
        controle=[controle i];
        valido=0;
    else if(T(i)==0 & ~valido)
        controle=[controle i];
        valido=1;
    end
    end
end

for i = 1:2:length(controle)
    T(controle(i)-300:controle(i)-1) = 2;
    T(controle(i) : controle(i+1)+60) = 1;
end
resultado=T;
end