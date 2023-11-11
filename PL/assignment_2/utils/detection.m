function [Sensitivity,Specifit] = detection(result, target)

    TP=0; FP=0; TN=0; FN=0;
    for i=1:length(result)
        if(result(i)==3 && target(i)==3)
            TP=TP+1;
        elseif(result(i)==3 && target(i)~=3)
            FP=FP+1;
        elseif(result(i)~=3 && target(i)~=3)
            TN=TN+1;
        elseif(result(i)~=3 && target(i)==3)
            FN=FN+1;
        end
    end
    Sensitivity=TP/(TP+FN)
    Specifit=TN/(TN+FP)

end