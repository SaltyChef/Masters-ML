function [Sensitivity,Specifit] = detection(result, target)
    
    index_pre = find(target(:,3));
    index = [find(target(:,1)) find(target(:,2))];

    logical_positives = result(index_pre,:)==target(index_pre,:); 
    logical_negatives = result(index,:)==target(index,:);

    TP=sum(logical_positives);
    TN=sum(logical_negatives);
    
    FP=length(logical_negatives)-TN;
    FN=length(logical_positives)-TP;

    Sensitivity=TP/(TP+FN);
    Specifit=TN/(TN+FP);

end