function  resultado= correctTarget(T)
result= ones(length(T),1);
controle = [];
valido=1;
for i=1:length(T)
    if(T(i)==1 & valido)
        controle=[controle i];
        valido=0;
    else if(T(i)==0 & ~valido)
        controle=[controle i];
        valido=1;
    end
    end
end
resultado=controle;
end