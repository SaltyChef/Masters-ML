function [new_p, new_t] = balance_sets(p, t)
    index_of_t_interictal = find(t(1, :) == 1);
    index_of_t_preictal = find(t(2, :) == 1);
    index_of_t_ictal = find(t(3, :) == 1);
    
    size_without_interictal = length(index_of_t_preictal) + length(index_of_t_ictal);
    
    indexes_for_new_t_interictal = randperm(length(index_of_t_interictal));
    new_index_t_interictal = index_of_t_interictal(indexes_for_new_t_interictal);
    new_index_t_interictal = new_index_t_interictal(:, 1:size_without_interictal);
    
    new_order = sort([new_index_t_interictal index_of_t_preictal index_of_t_ictal]);
    new_p = p(:, new_order); 
    new_t = t(:, new_order);
end