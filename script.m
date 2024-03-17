clear all;
clc;
% Load the identification and validation data
load('data.mat'); % Loading the project data

% Generate the design matrix for identification data
n1_id = size(id.X{1}, 2); % Number of grid points
n2_id = size(id.X{2}, 2);
n1_val = size(val.X{1}, 2); % Number of grid points
n2_val = size(val.X{2}, 2);
power=0;
newel=1;
% Initialize variables to store MSE for identification and validation
mse_id_array = [];
mse_val_array = [];

% Citirea datelor si a stocarea dimensiunilor in diverse variabile (1-15)

for m = 1:10 % We take m as the power for polynomial
    ghat = [];  % Create the matrix for the combination of inputs
    for i = 1:n1_id
        for j = 1:n2_id
            x1 = id.X{1}(i); % Identification input matrix rows
            x2 = id.X{2}(j);
            gline = []; % Here we stock the data for a single line of the matrix
            vect = [1 x1 x2]; % Here are the elements that go to create gline
            for indice = 1:length(vect)
                gline = g_line(gline, vect, power, m, newel, indice);
            end
            ghat = [ghat; gline]; % Here is the creation of the matrix
        end
    end
    y_id = id.Y(:);
    theta = ghat \ y_id;
    yhat_id = ghat * theta;
    MSE = 0;
    for i = 1:length(y_id)
        MSE = MSE + ((yhat_id(i) - y_id(i))^2);
    end
    mse_id = (1/length(y_id) * MSE);
    mse_id_array(m) = mse_id;
    
    % From here validation begins
    ghat = [];
    for i = 1:n1_val
        for j = 1:n2_val
            x1 = val.X{1}(i); % Identification input matrix rows
            x2 = val.X{2}(j);
            gline = []; % Here we stock the data for a single line of the matrix
            vect = [1 x1 x2]; % Here are the elements that go to create gline
            for indice = 1:length(vect)
                gline = g_line(gline, vect, power, m, newel, indice);
            end
            ghat = [ghat; gline]; % Here is the creation of the matrix
        end
    end

    y_val = val.Y(:);
    yhat_val = ghat * theta;
    MSE = 0;
    for i = 1:length(y_val)
        MSE = MSE + ((yhat_val(i) - y_val(i))^2);
    end
    mse_val = (1/length(y_val) * MSE);
    mse_val_array(m) = mse_val;
end

% 17-67 implementarea ideii de aproximare polinomiala pentru datele de
% identificare si validare, oricare ar fi m gradul polinomului prin
% utilizarea functiei g_line + functie g_line explicata.

% Find the minimum MSE and corresponding m
[min_mse_val, min_m] = min(mse_val_array);

% Plotting the identification error and validation error
plot(mse_id_array, 'b', 'LineWidth', 2); grid; shg;
hold on
plot(mse_val_array, 'k', 'LineWidth', 2);

% Adding legend
legend('Identification Error', 'Validation Error');

% Adding titles and labels if needed
title('Identification and Validation Errors');
ylabel('Mean Squared Error');

% Display the results
fprintf('Minimum MSE for Validation Data: %f (m = %d)\n', min_mse_val, min_m);

% Display the MSE for both identification and validation data
fprintf('MSE for Identification Data: %f\n', mse_id);
fprintf('MSE for Validation Data: %f\n', mse_val);

% 72-92 Aflarea m-ului pentru MSE minim si plotarea MSE de identification
% si validation cu legenda
%% Now for the minimum m

clear all;
clc;
% Load the identification and validation data
load('proj_fit_27.mat'); % Loading the project data

% Generate the design matrix for identification data
n1_id = size(id.X{1}, 2); % Number of grid points
n2_id = size(id.X{2}, 2);
n1_val = size(val.X{1}, 2); % Number of grid points
n2_val = size(val.X{2}, 2);
power=0;
newel=1;
% Initialize variables to store MSE for identification and validation
mse_id_array = [];
mse_val_array = [];
m=5;
ghat = [];  % Create the matrix for the combination of inputs
for i = 1:n1_id
    for j = 1:n2_id
        x1 = id.X{1}(i); % Identification input matrix rows
        x2 = id.X{2}(j);
        gline = []; % Here we stock the data for a single line of the matrix
        vect = [1 x1 x2]; % Here are the elements that go to create gline
        for indice = 1:length(vect)
            gline = g_line(gline, vect, power, m, newel, indice);
        end
        ghat = [ghat; gline]; % Here is the creation of the matrix
    end
end
y_id = id.Y(:);
theta = ghat \ y_id;
yhat_id = ghat * theta;
MSE = 0;
for i = 1:length(y_id)
    MSE = MSE + ((yhat_id(i) - y_id(i))^2);
end
mse_id = (1/length(y_id) * MSE);
% From here validation begins
ghat = [];
for i = 1:n1_val
    for j = 1:n2_val
        x1 = val.X{1}(i); % Identification input matrix rows
        x2 = val.X{2}(j);
        gline = []; % Here we stock the data for a single line of the matrix
        vect = [1 x1 x2]; % Here are the elements that go to create gline
        for indice = 1:length(vect)
            gline = g_line(gline, vect, power, m, newel, indice);
        end
        ghat = [ghat; gline]; % Here is the creation of the matrix
    end
end

y_val = val.Y(:);
yhat_val = ghat * theta;
MSE = 0;
for i = 1:length(y_val)
    MSE = MSE + ((yhat_val(i) - y_val(i))^2);
end
mse_val = (1/length(y_val) * MSE);

% 97-156 Implementarea functiei de aproximare polinomiala pentru m minim 

% Define a grid of points for 3D visualization
[x1_grid, x2_grid] = meshgrid(id.X{1}, id.X{2});
x1_flat = x1_grid(:);
x2_flat = x2_grid(:);

% Plot the identification data and the polynomial approximator in 3D
figure;
subplot(121);
surf(x1_grid, x2_grid, id.Y);
title('Identification Data');
xlabel('X1');
ylabel('X2');
zlabel('f(X1, X2)');

% Define a grid of points for 3D visualization on validation data
[x1_val_grid, x2_val_grid] = meshgrid(val.X{1}, val.X{2});
x1_val_flat = x1_val_grid(:);
x2_val_flat = x2_val_grid(:);

% Plot the validation data and the polynomial approximator  in 3D for validation data
subplot(122);
surf(x1_val_grid, x2_val_grid, reshape(yhat_val, size(x1_val_grid)), 'EdgeColor','r');
hold on;
surf(x1_val_grid, x2_val_grid, reshape(y_val, size(x1_val_grid)), 'EdgeColor','k');
title('Validation Data');
xlabel('X1');
ylabel('X2');
zlabel('f(X1, X2)');

fprintf('Degree: %d\n', m);
fprintf('MSE: %f\n', MSE);
fprintf('MSE for Identification Data: %f\n', mse_id);
fprintf('MSE for Validation Data: %f\n', mse_val);

% 161 - 187 Defining a grid of points and plotting the validation data and the polynomial approximator  in 3D for validation data
