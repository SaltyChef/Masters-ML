function classifier2L = classifier_hidden(P, T)
net = patternnet(256);
net = train(net, P, T);
classifier2L = net;
save("classifier2L.mat", 'classifier2L');
end

