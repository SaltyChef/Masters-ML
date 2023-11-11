function [novo_p,novo_t] = balanceTrainSet(P, T_corrigido)
    if(sum(T_corrigido(:,1)) > (sum(T_corrigido(:,2)) + sum(T_corrigido(:,3))))
        lengthResultado = sum(T_corrigido(:,1))-(sum(T_corrigido(:,2)) + sum(T_corrigido(:,3)));
        index=zeros(1, lengthResultado);

        novo_P = ones(lengthResultado,29);
        novo_T = ones(lengthResultado,3);

        pilha = randperm(length(T_corrigido),length(T_corrigido));
        i=1;
        j=1;
        while(index(end)==0)
            if(T_corrigido(pilha(i),1)==1)
                index(j)=pilha(i);
                j=j+1;
            end
            i=i+1;
        end
        index=sort(index);
        i=1;
        j=1;
        while(j<length(novo_P))
            if(j==index(i))
                i=i+1;
            else
                novo_P(j,:)=P(i,:);
                novo_T(j,:)=T_corrigido(i,:);
                j=j+1;
            end
        end
        novo_p=novo_P;
        novo_t=novo_T;
    end
end