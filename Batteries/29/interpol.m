close all;

% Read tables from CSV files with specified delimiters and decimal separators
OCV_C = readtable('29_C2 charge.csv', 'Delimiter', ';', 'DecimalSeparator', ',');
OCV_D = readtable('29_C2 discharge.csv', 'Delimiter', ';', 'DecimalSeparator', ',');

% Convert tables to matrices
OCV_C = OCV_C{:,:};
OCV_D = OCV_D{:,:};

% Define interpolation points
SOC = 0:0.1:1;

% Perform linear interpolation and ensure boundary points match original data
OCV_C_interp = interp1(OCV_C(:,1), OCV_C(:,2), SOC, 'linear', 'extrap');
OCV_D_interp = interp1(OCV_D(:,1), OCV_D(:,2), SOC, 'linear', 'extrap');
OCV_C_interp([1, end]) = OCV_C([1, end], 2);
OCV_D_interp([1, end]) = OCV_D([1, end], 2);

% Calculate the average of interpolated values
OCV_A = (OCV_C_interp + OCV_D_interp) / 2;

% Prepare data for writing to CSV
M = [SOC', OCV_A'];

% Plot the results
figure;
hold on;
grid on;
plot(SOC, OCV_C_interp, 'b--', SOC, OCV_D_interp, 'm--', SOC, OCV_A, 'r');
legend({'OCV charge Interpolated', 'OCV discharge Interpolated', 'Average OCV'}, 'Location', 'northwest');
title('Charge, Discharge, Average');
xlabel('SOC');
ylabel('OCV');
hold off;

% Write the result to a CSV file
writematrix(M, '29_C2.csv', 'Delimiter', ';');
