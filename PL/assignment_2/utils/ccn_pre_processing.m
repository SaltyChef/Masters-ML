%Função que organiza o data para data em 4D
function [data_4D, Target_4D] = ccn_pre_processing(data, target)
    
    ind_interictal = find(target(1,:) == 1);
    ind_preictal = find(target(2,:) == 1);
    ind_ictal = find(target(3,:) == 1); 
   
    data_inter = data(:,ind_interictal);
    data_pre = data(:,ind_preictal);
    data_ictal = data(:,ind_ictal);
    
    cell = {}; 
    
    dim_pre = 0;
    for i = 1:29:length(ind_preictal)
        %se ha pelo menos 29 momentos restantes
        if i < length(ind_preictal) - 28
            dim_pre = dim_pre + 1;
            aux = data_pre(:,i:i+28); %encontra os 29 momentos seguidos
            cell{end+1,1} = aux; %acrescenta classe ao array cell
        end
    end

    dim_ictal = 0;
    for i = 1:29:length(ind_ictal)
        if i < length(ind_ictal) - 28
            dim_ictal = dim_ictal + 1;
            aux = data_ictal(:,i:i+28);
            cell{end+1,1} = aux; 
        end
    end
    
 
    dim_total_ictal = dim_pre + dim_ictal;

    dim_inter = 0;
    for i = 1:29:length(ind_interictal)
        if dim_inter < dim_total_ictal
            if i < length(ind_interictal) - 28
                dim_inter = dim_inter + 1;
                aux = data_inter(:,i:i+28);
                cell{end+1,1} = aux; 
            end
        end
    end
   
    data_4D = cat(4, cell{:});
    Target_4D = categorical([repmat(3,dim_ictal,1); repmat(2,dim_pre,1); ones(dim_inter,1)]);
end