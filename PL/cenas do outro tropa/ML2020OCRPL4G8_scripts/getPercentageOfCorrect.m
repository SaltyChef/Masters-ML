function perc = getPercentageOfCorrect(A, T)
    correct = 0;
    for i = 1:5
        for j = 1:10
            value = A(i,j) - T(i,j);
            if value == 0
                correct = correct + 1;
            end
        end
    end
    perc = correct/50 * 100;
end

