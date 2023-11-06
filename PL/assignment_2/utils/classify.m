function result = classify(P)
    %% DIVIDING THE DATASET %%%%%%%%%%
    percentageTrain = 0.85;
    
    breakingIndex = round(length(P) * percentageTrain);
    data_treino = P(1:breakingIndex, :);
    data_test = P(breakingIndex+1:end , :);

    size(data_treino)
    size(data_test)
   
    %%
    



    %result = [data_treino, data_test]
end
