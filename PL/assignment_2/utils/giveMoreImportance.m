function data_transformed = giveMoreImportance(target)
    data_transformed = target;
    
    factorPre = sum(target(:,2) == 1) / sum(target(:,1) == 1);
    factorIctal = sum(target(:,3) == 1) / sum(target(:,1) == 1);
    
    for i = 1:length(target)
        if(target(i,1) == 1)
            data_transformed(i,:) = target(i,:) *  ((factorPre + factorIctal) / 2);
        end
        if(target(i,2) == 1)
           data_transformed(i,:) = target(i,:) * (0.5/factorPre);
        end
        if(target(i,3) == 1)
            data_transformed(i,:) = target(i,:) * (0.5/factorIctal);
        end 
        
    end
end




