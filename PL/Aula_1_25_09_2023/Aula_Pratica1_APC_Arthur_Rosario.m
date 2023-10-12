%% Calculo de entropia por tabela.
positivos=input("Entre os valores positivos encontrados na tabela: "); %valores de entropia positivo
negativos=input("Entre os valores negativos encontrados na tabela: ");%valores de entropia negativo
total=positivos+negativos; %soma dos valores anteriores
entropia=@(pos, neg,total) -pos/(total)*log2(pos/(total))-neg/total*log2(neg/total); %funcao de entropia
resultado=entropia(positivos,negativos,total);
%% First assigment
matrix0=load("P0.mat");
matrix1=load("P1.mat").P;
matrix2=load("P2.mat").P;
matrix3=load("P3.mat").P;
matrix4=load("P4.mat").P;
matrix5=load("P5.mat").P;
matrix6=load("P6.mat").P;
matrix7=load("P7.mat").P;
matrix8=load("P8.mat").P;
matrix9=load("P9.mat").P;
% final=cat(2,matrix0,matrix1,matrix2,matrix3,matrix4,matrix5,matrix6,matrix7,matrix8,matrix9);



