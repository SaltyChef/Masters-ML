function  postProcessing(result, target)
    
    indexes = [];
    count = [0 0 0];
    for i = 1:10:length(result)-10
        count(1) = nnz(find(result(i:i+9) == 1));
        count(2) = nnz(find(result(i:i+9) == 2));
        count(3) = nnz(find(result(i:i+9) == 3));
        
        [max_count, index_count] = max(count);
        
        if(max_count >= 5)
             for j = i:i+9
                if(result(j) == index_count)
                    indexes = [indexes j];
                end
            end
        end
      
    end

    result = result(indexes);
    target = target(indexes);
    [sens_pred, spec_pred, sens_det, spec_det] = confMatrix(result, target)
end