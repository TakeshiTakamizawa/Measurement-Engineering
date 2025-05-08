%% <<< Example Problem 3 >>> %%
clc; close all; clear;

% Load data points
load('Least_Square_Method_Ohm_problem3.mat');

[x_solve, y_solve, coeffs] = LeastSquaresMethod(current_data, voltage_data);
plot_data(current_data, voltage_data, x_solve, y_solve)
fprintf('Resistor： %.4f Ω\n', coeffs(1));
fprintf('Offset：   %.4f V\n', coeffs(2));

function [x_solve, y_solve, coeffs] = LeastSquaresMethod(data_x, data_y)
    A = [data_x, ones(size(data_x))];
    b = data_y;
    coeffs = inv(A' * A) * (A' * b);
    x_solve = linspace(min(data_x)-2, max(data_x)+2, 100);
    y_solve = coeffs(1) * x_solve + coeffs(2);
end

function plot_data(data_x, data_y, x_solve, y_solve)
    plot(data_x, data_y, 'o', 'MarkerFaceColor', 'b',LineWidth=3); hold on
    plot(x_solve, y_solve,'-', LineWidth=5, Color='r'); grid on;
    axis([min(data_x)-1 max(data_x)+1 min(data_y)-1 max(data_y)+1])
    legend('Data points', 'Least squares method')
    xlabel('$ Current ~Data $','Interpreter','latex','FontSize',20); 
    ylabel('$ Voltage ~Data $','Interpreter','latex','FontSize',20);
    title('Example Problem 2','FontSize',20)
end