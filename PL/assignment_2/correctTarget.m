function  resultado= correctTarget(T)
result = [ones(length(T),1) zeros(length(T),1) zeros(length(T),1)];
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
    result(controle(i)-300:controle(i)-1,3) = 1;
    result(controle(i) : controle(i+1)+60,2) = 1;
    result(controle(i)-300 : controle(i+1),1) = 0;
end
resultado=result;
end