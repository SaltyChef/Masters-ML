function netFilter = create_associativeMemory(P)
    %create target
    load PerfectArial.mat
    f = size(P);
    T = zeros(256, f(1,2))
    
    for i = 1:f(1,2)
        if(mod(i, 10)) == 0 
            T(:,i) = Perfect(:,10);
        else
            T(:,i) = Perfect(:,mod(i,10));
    
        end
    end
    
    pinv_ = pinv(P);
    W = T * pinv_; 
    new_P = W * P;
    
    netFilter = perceptron;
    f = size(new_P);
    for i = 1 : f(1,2)
        p = new_P(:,i);
        t = T(:, i);
        netFilter = adapt(netFilter, p, t);
    end
    view(netFilter);
    save("models/AssociativeMemoryFilter.mat", 'netFilter')

