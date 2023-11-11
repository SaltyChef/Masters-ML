function [new_p, new_t] = lstm_preprocessing(P, T)
    new_p = {};
    new_t = [];
    
    [~, T] = max(T);
    
    for i = 1:size(P, 2)
        new_p{end + 1, 1} = P(:, i);
        new_t = [new_t; T(i)];
    end
    
    new_t = categorical(new_t);
end