% Aprendizagem Computacional 22/23
% Mariana Montenegro (2019245964), Pedro Ferreira (2019170165)
% Parte A - Controlo Fuzzy

clear all
clc

%% Calcular polos da matriz de transferência

num = 25;
den = [1 9 28 30];
polos = roots(den);

H = tf(num,den);
pzmap(H)
grid on

%polos=-3.0000 + 1.0000i; -3.0000 - 1.0000i; -3.0000 + 0.0000i

%% Carregar controladores para o workspace

mamdani_9_trim = readfis('Mamdani_9rules.fis');
mamdani_25_trim = readfis('Mamdani_25rules.fis');
mamdani_49_trim = readfis('Mamdani_49rules.fis');

mamdani_9_gauss = readfis('Mamdani_9rules_gauss.fis');
mamdani_25_gauss = readfis('Mamdani_25rules_gauss.fis');
mamdani_49_gauss = readfis('Mamdani_49rules_gauss.fis');

sugeno_9_trim = readfis('Sugeno_9rules.fis');
sugeno_25_trim = readfis('Sugeno_25rules.fis');
sugeno_49_trim = readfis('Sugeno_49rules.fis');

sugeno_9_gauss = readfis('Sugeno_9rules_gauss.fis');
sugeno_25_gauss = readfis('Sugeno_25rules_gauss.fis');
sugeno_49_gauss = readfis('Sugeno_49rules_gauss.fis');


open_system('parteA.slx')