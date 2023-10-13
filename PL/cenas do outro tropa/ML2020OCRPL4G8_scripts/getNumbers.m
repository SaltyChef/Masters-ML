function res = getNumbers(matrix)
    [~,ii] = max(matrix);
    res = ii;
    res = reshape(res, [10, 5])';
end

