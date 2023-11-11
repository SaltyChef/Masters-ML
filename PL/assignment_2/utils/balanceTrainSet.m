function [novo_p,novo_t] = balanceTrainSet(P, T_corrigido)
        lengthResultado = sum(T_corrigido(:,1))-(sum(T_corrigido(:,2)) + sum(T_corrigido(:,3)));
        index = find(T_corrigido(:,1));
        index(randperm(length(index)));
        index=index(1:lengthResultado);
        T_corrigido(index,:)=[];
        P(index,:)=[];
        novo_p=P;
        novo_t=T_corrigido;
end