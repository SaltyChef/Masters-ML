% Aprendizagem Computacional 22/23
% Mariana Montenegro (2019245964), Pedro Ferreira (2019170165)
% Parte B - Sistemas Neuro-Fuzzy

% gerar o dataset representativo da dinamica do sistema.

clear all
clc
%% DISCRETIZACAO

num = 25;
den = [1 9 28 30];

p = real(roots(den)); % polos reais
t = -1./p;
Ts = min(t)/4;

[numd, dend] = c2dm(num, den, Ts,'method', 'zoh');

%numd=0 , 0.002 , 0.0066 , 0.0014
%dend= 1, -2.331 , 1.8154 , -0.4724
%Ts=0.0833
%p=-3,-3,-3
%t=0.333,0.333,0.333

%% CRIACAO DO DATASET

out = sim('parteB');

y = out.DiscreteOut.Data;
u = out.InputRandom.Data;

data = [y(3:end-1) y(2:end-2) y(1:end-3) u(3:end-1) u(2:end-2) u(1:end-3) y(4:end)];

% Dvisao do dataset: 70% (treino) + 30% (teste)
n = length(data);
n_train = round(n*0.7, 0);
train_data = data(1:n_train,:);
test_data = data(n_train+1:end,:);

% Salvar dataset
save('data.mat','data');
save('train_data.mat','train_data');
save('test_data.mat','test_data');

