function new_m = associative(matrix, target)

pinv_ = pinv(matrix);
%[m,n] = size(pinv_);

W = target * pinv_; 

new_m = W * matrix;

return;