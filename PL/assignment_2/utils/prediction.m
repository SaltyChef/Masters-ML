function [Sensitivity,Specifit] = prediction(result, target)
    
    TP=0; FP=0; TN=0; FN=0;
    for i=1:length(result)
        if(result(i)==2 && target(i)==2)
            TP=TP+1;
        elseif(result(i)==2 && target(i)~=2)
            FP=FP+1;
        elseif(result(i)~=2 && target(i)~=2)
            TN=TN+1;
        elseif(result(i)~=2 && target(i)==2)
            FN=FN+1;
        end
    end
    Sensitivity=TP/(TP+FN)
    Specifit=TN/(TN+FP)

end