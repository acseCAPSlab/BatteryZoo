% Define the variable for the folder name
folder_number = 38;

path_OCV = [num2str(folder_number) '\' num2str(folder_number) '_OCV.csv'];
data_OCV = readtable(path_OCV, 'Delimiter',';', 'DecimalSeparator', ',');
data_OCV.Properties.VariableNames = {'SOC', 'OCV'};

% Generate some example data
xdata = data_OCV.SOC;
ydata = data_OCV.OCV;

% Define the model function to fit (a polynomial)
modelFunc_poly = @(params, x) polyval(params, x);

% Initial guess for the coefficients of the polynomial
initialGuess_poly = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

% Use lsqcurvefit to fit the model to the data
paramsFit_poly = lsqcurvefit(modelFunc_poly, initialGuess_poly, xdata, ydata);

% Evaluate the model with the fitted parameters
yFit_poly = modelFunc_poly(paramsFit_poly, xdata);

% Plot the original data and the fitted curve
plot(xdata, ydata, '.', xdata, yFit_poly, '-')
grid on
legend('Data', 'Fitted curve','Location','southeast')
xlabel('SOC')
ylabel('OCV')
title('Fitting OCV curve with a polynomial curve')
xlim([0 1]);

squared_errors = (ydata - yFit_poly).^2;
mean_squared_error = mean(squared_errors)

% Save the array with a curve coefficients to a .mat file
path_coeff = [num2str(folder_number) '\' num2str(folder_number) '_coeff.mat'];
save(path_coeff, "paramsFit_poly");
