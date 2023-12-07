% Aprendizagem Computacional 22/23
% Mariana Montenegro (2019245964), Pedro Ferreira (2019170165)
% Parte B - Sistemas Neuro-Fuzzy

%obtencao do output a partir dos dados de teste e avaliacao da performance do sistema

clear all
clc

%% CARREGAR DADOS

% TREINO
load('train_data.mat');
train_input =  train_data(:,1:6);
train_output = train_data(:,7);

% TESTE
load('test_data.mat');
test_input = test_data(:,1:6);
test_target = test_data(:,7);

%% CLUSTERING 

% Subtractive clustering
options = genfisOptions('SubtractiveClustering'); 
options.Verbose = false;
sub = genfis(train_input, train_output, options);

disp('Subtractive Clustering - Rules:'); 
disp(showrule(sub)); 
disp(' ');

% Fuzzy c-means clustering
options = genfisOptions('FCMClustering'); 
options.Verbose = false;
fcm = genfis(train_input, train_output, options);

disp('FCM Clustering - Rules:'); 
disp(showrule(fcm)); 
disp(' ');

% Grid partitioning
options = genfisOptions('GridPartition'); 
grid = genfis(train_input, train_output, options);

disp('Grid Partition - Rules:'); 
disp(showrule(grid)); 
disp(' ');

%% OTIMIZACAO + GUARDAR FIS
 
% Subtractive: Backpropagation
options = anfisOptions('OptimizationMethod',0,'InitialFIS',sub);
subB = anfis(train_data, options);
writeFIS(subB,'sub_backpropagation');

% Subtractive: Hybrid
options = anfisOptions('OptimizationMethod',1,'InitialFIS',sub);
subH = anfis(train_data, options);
writeFIS(subH,'sub_hybrid');

% Fuzzy c-means: Backpropagation
options = anfisOptions('OptimizationMethod',0,'InitialFIS',fcm);
fcmB = anfis(train_data, options);
writeFIS(fcmB,'fcm_backpropagation');

% Fuzzy c-means: Hybrid
options = anfisOptions('OptimizationMethod',1,'InitialFIS',fcm);
fcmH = anfis(train_data, options);
writeFIS(fcmH,'fcm_hybrid');

% Grid: Backpropagation
options = anfisOptions('OptimizationMethod',0,'InitialFIS',grid);
gridB = anfis(train_data, options);
writeFIS(gridB,'grid_backpropagation');

% Grid: Hybrid
options = anfisOptions('OptimizationMethod',1,'InitialFIS',grid);
gridH = anfis(train_data, options);
writeFIS(gridH,'grid_hybrid');

%% TESTE

% Subtractive: Backpropagation
output_subB = evalfis(test_input, subB);
mse_subB = immse(test_target, output_subB);

% Subtractive: Hybrid
output_subH = evalfis(test_input, subH);
mse_subH = immse(test_target, output_subH);

% Fuzzy c-means: Backpropagation
output_fcmB = evalfis(test_input,fcmB);
mse_fcmB = immse(test_target, output_fcmB);

% Fuzzy c-means: Hybrid
output_fcmH = evalfis(test_input,fcmH);
mse_fcmH = immse(test_target, output_fcmH);

% Grid: Backpropagation
output_gridB = evalfis(test_input,gridB);
mse_gridB = immse(test_target, output_gridB);

% Grid: Hybrid
output_gridH = evalfis(test_input,gridH);
mse_gridH = immse(test_target, output_gridH);

%% PERFORMANCE

open_system('parteB_performance');
