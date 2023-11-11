function [sens_preds,spec_preds,sens_detect,spec_detect] = ConfMatrixMet2(test_target,test_results,network_type)
        %Method for seizure for seizure
        if isequal(network_type,'LSTM')
            target = grp2idx(test_target)';
            result = grp2idx(test_results)';
        elseif isequal(network_type,'shallow')
            [~,target] = max(test_target);
            [~,result] = max(test_results);
        end     
          
        processed = zeros(length(result),1);
        for i=1:length(result)
            if(i <= length(result)-10)
                inter=nnz(find(result(i:i+9)==1));
                pre=nnz(find(result(i:i+9)==2));
                ictal=nnz(find(result(i:i+9)==3));
                pos=nnz(find(result(i:i+9)==4));
                [max_class,index]=max([inter,pre,ictal,pos]);                
                if max_class >= 5
                    processed(i)=index;
                else
                    processed(i)=result(i);
                end
            else
                processed(i)=result(i);
            end
        end
        
        result = processed;      
        conf_matrix = confusionmat(target,result);
        
        TP=zeros(1,3);
        FN=zeros(1,3);
        FP=zeros(1,3);
        TN=zeros(1,3);
        
        %Determine the values of true positives, true negatives, false
        %positives and false negatives
        for i=1:3
            TP(i)=conf_matrix(i,i);
            FN(i)=sum(conf_matrix(i,:))-conf_matrix(i,i);
            FP(i)=sum(conf_matrix(:,i))-conf_matrix(i,i);
            TN(i)=sum(conf_matrix(:))-TP(i)-FP(i)-FN(i);
        end
        
        %Calculate confusion matrix based on formulas specified on report       
        sens_preds = TP(2)/(TP(2)+FN(2))*100;
        spec_preds = TN(2)/(TN(2)+FP(2))*100;

        sens_detect = TP(3)/(TP(3)+FN(3))*100;
        spec_detect = TN(3)/(TN(3)+FP(3))*100;    
    
end

