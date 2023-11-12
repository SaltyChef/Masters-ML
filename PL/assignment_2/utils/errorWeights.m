function EW = errorWeights(target_treino)
    %Get dimension of each class
    dimInter = nnz(find(all(target_treino==[1 0 0]')));     %vai buscar o numero de 1s posicionados mais a esquerda + os no centro + os da direita
    dimPreictal = nnz(find(all(target_treino==[0 1 0]')));
    dimIctal = nnz(find(all(target_treino==[0 0 1]')));
    dimTotal = dimInter + dimPreictal + dimIctal;
   
    %Define weight vector based on dimension of each class, smallest class gets the highest weight  
    pInter = dimTotal/dimInter;
    pPre = dimTotal/dimPreictal;
    pIctal = dimTotal/dimIctal;
    EW = all(target_treino==[1 0 0]')*pInter + all(target_treino==[0 1 0]')*pPre + all(target_treino==[0 0 1]')*pIctal;
   
end