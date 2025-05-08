%% <<< Example Problem 1 >>> %%
clc; close all; clear;

% MATLAB Solution 1
data_x = [1; 2; 3; 4];
data_y = [2; 4; 6; 8];
A = [data_x, ones(size(data_x))];
b = data_y;

% MATLAB Solution 2 & 3
x = inv(A' * A) * (A' * b);
x_solve = linspace(min(data_x)-2, max(data_x)+2, 100);
y_solve = x(1) * x_solve + x(2);

% MATLAB Solution 4
plot(data_x, data_y, 'o',LineWidth=10, Color='r'); hold on
plot(x_solve, y_solve,'-', LineWidth=5, Color='b'); grid on;
axis([min(data_x)-1 max(data_x)+1 min(data_y)-1 max(data_y)+1])
legend('Data points', 'Least squares method')
xlabel('$ x $','Interpreter','latex','FontSize',20); 
ylabel('$ y $','Interpreter','latex','FontSize',20);
title('Example Problem 1','FontSize',20)