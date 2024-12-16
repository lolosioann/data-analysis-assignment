%% Exe2Prog1 - Group XX
% Ioannis Lolos, AEM 10674

clc; clear; close all;
% Read whole excel table and keep the columns of interest
T = readtable('TMS.xlsx');
tms = T.("TMS");
edDuration = T.("EDduration");
coilCode = cell2mat(T.("CoilCode")');
% Split the data depending on CoilCode and TMS usage
edDurCirc = edDuration(tms==1);
edDurCirc = edDurCirc(coilCode=='0');
edDur8 = edDuration(tms==1);
edDur8 = edDur8(coilCode=='1');
disp(size(edDur8));
% Perform Resampling
nResamples = 1000;
pdCirc = fitdist(edDurCirc, 'Exponential');
pd8 = fitdist(edDur8, 'Exponential');
edDurCircResampled = random(pdCirc, nResamples, 1);
edDur8Resampled = random(pd8, nResamples, 1);
figure;
histogram(edDurCircResampled, 'Normalization', 'pdf', 'FaceColor', 'blue');
figure;
histogram(edDur8Resampled, 'Normalization', 'pdf', 'FaceColor', 'red');