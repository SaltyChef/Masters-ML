function [target_m, indexes] = prepare_tests(T)
    ts = size(T(:, 1));
    sets = 1:ts;
    flag = 0;
    curr_position = 1;
    test_position = 1;
    
    interictal_indexes = [];  % nomral brain waves
    preictal_indexes = [];    % a seizure is coming
    ictal_indexes = [];       % a seizure is happening
    
    while flag == 0
        if T(test_position, 1) == 0  % posicao de linha e coluna 1
            test_position = test_position + 1; % aumenta a linha
            
            if test_position >= ts   % se for a ultima linha 
                sets(curr_position:test_position) = 1;  %mete tudo a uns ate a ultima linha pois nao foi registado mais atividade cerebral
                
                interictal_indexes = [interictal_indexes curr_position];
                
                flag = 1;
            end
        
        else
            if test_position - curr_position >= 900
                %1 is inter-ictal, normal brain activity
                sets(curr_position:(test_position - 900)) = 1;
                
                interictal_indexes = [interictal_indexes curr_position];
                
                curr_position = (test_position - 900);
                
            end    
         
            %2 is pre-ictal, 300 seconds before a seizure
            sets(curr_position:test_position) = 2;
            
            preictal_indexes = [preictal_indexes curr_position];
            
            curr_position = test_position;

            while T(test_position, 1) == 1
                test_position = test_position + 1;
            end
            
            %3 is ictal, seizure
            sets(curr_position:test_position) = 3;
            
            ictal_indexes = [ictal_indexes curr_position];
            
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
    
    indexes = [interictal_indexes preictal_indexes ictal_indexes];
end