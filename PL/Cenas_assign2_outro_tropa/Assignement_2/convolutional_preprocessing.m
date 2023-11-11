function [P_CNN_4D, T_CNN] = convolutional_preprocessing(feat, trg)
    
    %Procurar todos os indices de cada classe
    ind_interictal = find(trg(1,:) == 1);
    ind_preictal = find(trg(2,:) == 1);
    ind_ictal = find(trg(3,:) == 1);
    
    %Procurar features correspondentes a cada classe
    feat_inter = feat(:,ind_interictal);
    feat_pre = feat(:,ind_preictal);
    feat_ictal = feat(:,ind_ictal);
    
    %configuracao das imagens de cada classe
    cell = {}; 
    
    dim_pre = 0;
    %divisao da classe preictal em varias imagens, com janelas de 29
    %momentos
    for i = 1:29:length(ind_preictal)
        %se ha pelo menos 29 momentos restantes
        if i < length(ind_preictal) - 28
            dim_pre = dim_pre + 1;
            aux = feat_pre(:,i:i+28); %encontra os 29 momentos seguidos
            cell{end+1,1} = aux; %acrescenta classe ao array cell
        end
    end
    
    dim_ictal = 0;
    %divisao da classe ictal em varias imagens, com janelas de 29
    %momentos
    for i = 1:29:length(ind_ictal)
        %se ha pelo menos 29 momentos restantes
        if i < length(ind_ictal) - 28
            dim_ictal = dim_ictal + 1;
            aux = feat_ictal(:,i:i+28); %encontra os 29 momentos seguidos
            cell{end+1,1} = aux; %acrescenta classe ao array cell
        end
    end
    
    %dimensao das imagens do preictal + ictal + posictal
    dim_total_ictal = dim_pre + dim_ictal;
    
    dim_inter = 0;
    %divisao da classe interictal em varias imagens, com janelas de 29
    %momentos
    for i = 1:29:length(ind_interictal)
        %ate termos o numero de dados necessarios(dim_total_ictal)
        if dim_inter < dim_total_ictal
            %se ha pelo menos 29 momentos restantes
            if i < length(ind_interictal) - 28
                dim_inter = dim_inter + 1;
                aux = feat_inter(:,i:i+28); %encontra os 29 momentos
                cell{end+1,1} = aux; %acrescenta classe ao array cell
            end
        end
    end
    
    %dados(P) em 4 dimensoes
    P_CNN_4D = cat(4, cell{:});
    
    %matriz com classe da imagem e dimensao das imagens da classe
    T_CNN = categorical([repmat(3,dim_ictal,1); repmat(2,dim_pre,1); ones(dim_inter,1)]);
end