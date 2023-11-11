function [ffRealTrg, ffRealFVS, fRealTrg, fRealFVS] = SetCreation(FeatVectSel,Trg)
    realTrg = [];
    fRealTrg = zeros(3,length(Trg));
    realFeatVectSel = FeatVectSel';
    fRealFVS = realFeatVectSel;
    count = 0;
    for i = 1:length(Trg)
        if Trg(i) == 1 && Trg(i-1) == 0
            realTrg(i) = 3;
            count = i;
            for j = 1:900
                realTrg(i-j) = 2;
            end
        else
            realTrg(i) = 1;
        end
    end
    
    for i = 1:length(realTrg)
        if realTrg(i) == 1
            fRealTrg(1,i) = 1;
        elseif realTrg(i) == 2
            fRealTrg(2,i) = 1;
        else
            fRealTrg(3,i) = 1;
        end
    end

    ind_interictal = find(realTrg == 1);
    ind_preictal = find(realTrg == 2);
    ind_ictal = find(realTrg == 3); %retirar indices de cada fase

    ind_rand = ind_interictal(randperm(length(ind_interictal)));
    inter_final = ind_rand(1:length(ind_preictal)+length(ind_ictal));
    indexes = sort([inter_final, ind_preictal, ind_ictal]);
    
    ffRealTrg = fRealTrg(:,indexes);
    ffRealFVS = fRealFVS(:,indexes);
end

