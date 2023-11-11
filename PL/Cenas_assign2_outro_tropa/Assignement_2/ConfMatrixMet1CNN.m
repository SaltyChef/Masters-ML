function [sens_preds,spec_preds,sens_detect,spec_detect] = ConfMatrixMet1CNN(test_target,test_results,network_type)
%Method for point for point
        if isequal(network_type,'CNN')
            target = grp2idx(test_target)';
            result = grp2idx(test_results)';
        end
        
        conf_matrix = confusionmat(target,result);
        
        TP=zeros(1,2);
        FN=zeros(1,2);
        FP=zeros(1,2);
        TN=zeros(1,2);
        
        %Determine the values of true positives, true negatives, false
        %positives and false negatives
        for i=1:2
            TP(i)=conf_matrix(i,i);
            FN(i)=sum(conf_matrix(i,:))-conf_matrix(i,i);
            FP(i)=sum(conf_matrix(:,i))-conf_matrix(i,i);
            TN(i)=sum(conf_matrix(:))-TP(i)-FP(i)-FN(i);
        end
        
        %Calculate confusion matrix based on formulas specified on report   
        sens_preds = TP(1)/(TP(1)+FN(1))*100;
        spec_preds = TN(1)/(TN(1)+FP(1))*100;

        sens_detect = TP(2)/(TP(2)+FN(2))*100;
        spec_detect = TN(2)/(TN(2)+FP(2))*100;
end

