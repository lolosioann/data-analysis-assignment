%% Exe1Prog1 - Group XX
% Ioannis Lolos, AEM 10674

clc; clear; close all;
% Read whole excel table and keep the columns of interest
T = readtable('TMS.xlsx');
tms = T.("TMS")';
edDuration = T.("EDduration")';
% Split the data depending on TMS usage
edDurNoTMS = edDuration(tms==0);
edDurWithTMS = edDuration(tms==1);
% Test for optimal distribution fit
disp('No TMS: ');
distrNoTMS = GroupXXExe1Fun1(edDurNoTMS); % Find best fit distribution
disp([distrNoTMS.ParameterNames, distrNoTMS.ParameterValues]); 
disp('With TMS: ');
distrWithTMS = GroupXXExe1Fun1(edDurWithTMS); % Find best fit distribution
disp([distrWithTMS.ParameterNames, distrWithTMS.ParameterValues]);
% Plot histograms and PDFs
x = linspace(0, 100, 10000);
pdfWithTMS = pdf(distrWithTMS, x);
pdfNoTMS = pdf(distrNoTMS, x);
figure;
t = tiledlayout(1, 2, 'TileSpacing', 'Compact', 'Padding', 'Compact');
% Plot without TMS
nexttile;
histogram(edDurNoTMS, 'NumBins', 20,'Normalization', 'pdf', 'FaceColor', 'blue');
hold on;
plot(x, pdfNoTMS, 'r-', 'LineWidth', 1.3);
xlabel('ED Duration');
ylabel('Probability Density');
legend('Data', 'Exponential Fit');
title('Distribution without TMS');
% Plot with TMS
nexttile;
histogram(edDurWithTMS, 'NumBins', 20, 'Normalization', 'pdf', 'FaceColor', 'blue');
hold on;
plot(x, pdfWithTMS, 'r-', 'LineWidth', 1.3);
xlabel('ED Duration');
ylabel('Probability Density');
legend('Data', 'Lognormal Fit');
title('Distribution with TMS');
% General plot settings
sgtitle('ED Duration Distributions');

%% Conclusion
%{
It appears that the ED duration data distributions differ when TMS is used.
The data without TMS seems to follow an exponential distribution, while the
data with TMS seems to follow a lognormal distribution. This is evident from
the PDFs of the two distributions.
%}
