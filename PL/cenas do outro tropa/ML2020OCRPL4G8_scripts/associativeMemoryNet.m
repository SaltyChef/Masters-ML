function am = associativeMemoryNet(P, T)

associated = associative(P, T);

am = perceptron;
%net.adaptFcn = "learnp";

for i = 1:500
    p = associated(:,i);
    t = T(:,i);
    am = adapt(am, p, t);
end

save("AssoFilter.mat", 'am');
end