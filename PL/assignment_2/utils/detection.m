function [Sensitivity,Specifit] = detection(result, target)
    
    index_pre = find(target(:,2));
    index_ictal = find(target(:,3));
    
    logical_positives = result(index_ictal,2)==target(index_ictal,2);
    logical_negatives = result(index_pre,3)==target(index_pre,3);
    

    TP=sum(logical_positives)
    TN=sum(logical_negatives);
    
    FP=length(logical_negatives)-TN;
    FN=length(logical_positives)-TP;

    Sensitivity=TP/(TP+FN);
    Specifit=TN/(TN+FP);

end