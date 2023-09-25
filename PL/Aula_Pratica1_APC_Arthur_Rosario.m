%% Calculo de entropia por tabela.
% possibilidades=input("possibilidades: ");
positivos=input("Entre os valores positivos encontrados na tabela: "); %valores de entropia positivo
negativos=input("Entre os valores negativos encontrados na tabela: ");%valores de entropia negativo
total=positivos+negativos; %soma dos valores anteriores
entropia=@(pos, neg,total) -pos/(total)*log2(pos/(total))-neg/total*log2(neg/total); %funcao de entropia
resultado=entropia(positivos,negativos,total)
%%
