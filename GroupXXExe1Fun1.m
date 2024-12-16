%% Exe1Fun1 - Group XX
% Ioannis Lolos, AEM 10674

function bestDistr = GroupXXExe1Fun1(data)
% returns the distribution of best fit for the data

distributions = {
        'Normal', 'Exponential', 'Lognormal',...
        'Poisson', 'Rayleigh', 'Weibull'};

idx = 0;
bestX2 = Inf;

for i = 1:length(distributions)
    distr = fitdist(data', distributions{i});
    [~, p, stats] = chi2gof(data, 'CDF', distr);
    if stats.chi2stat < bestX2
        bestX2 = stats.chi2stat;
        idx = i;
        bestDistr = distr;  
    end
end

disp(['Best fit: ' distributions{idx}, ', X2: ', num2str(bestX2), ', p-value: ', num2str(p)]);