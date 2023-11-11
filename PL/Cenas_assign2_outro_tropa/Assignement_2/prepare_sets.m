function target_m = prepare_sets(T)
    ts = size(T(:, 1));
    sets = 1:ts;
    flag = 0;
    curr_position = 1;
    test_position = 1;
    
    
    while flag == 0
        if T(test_position, 1) == 0
            test_position = test_position + 1;
            
            if test_position >= ts
                sets(curr_position:test_position) = 1;
                flag = 1;
            end
        
        else
            if test_position - curr_position >= 900
                %1 is inter-ictal, normal brain activity
                sets(curr_position:(test_position - 900)) = 1;
                
                curr_position = (test_position - 900);
                
            end    
         
            %2 is pre-ictal, 300 seconds before a seizure
            sets(curr_position:test_position) = 2;
            
            curr_position = test_position;

            while T(test_position, 1) == 1
                test_position = test_position + 1;
            end
            
            %3 is ictal, seizure
            sets(curr_position:test_position) = 3;
            
            curr_position = test_position;    
        end
    end
    
    sets_ready = zeros([ts, 1]);
    sets_ready(:,1) = sets;
    
    target_m = zeros([3, ts]);
    
    for index = 1:ts
        switch sets_ready(index,1)
            case 1
                target_m(:, index) = [1 0 0];
            case 2
                target_m(:, index) = [0 1 0];
            case 3
                target_m(:, index) = [0 0 1];
        end
    end
    
end