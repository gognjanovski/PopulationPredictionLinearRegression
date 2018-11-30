% Load Population Data
statistics_data = getCsvData('swe_pop_2007_2017.csv');

% Convert cell to matrix
X = cell2mat(statistics_data(:,1));
y = cell2mat(statistics_data(:,2));

% Convert matrix values to double
X = double(X);
y = double(y);

% Normalize features
[X_norm mu sigma] = featureNormalize(X);


m = length(y);
% Add ones column
X_norm = [ones(m, 1) X_norm];

hold on;

% Choose some alpha value
alpha = 0.1;
num_iters = 400;

% Init Theta and Run Gradient Descent 
[M N] = size(X_norm);
theta = zeros(2, 1);
theta = gradientDescent(X_norm, y, theta, alpha, num_iters)


% Set the x-axis label
xlabel('Year'); 
% Set the y-axis label
ylabel('Population'); 

% Plot population data
plot(X, y, 'rx', 'MarkerSize', 10);

% Predict population for 2020
pred_year = 2020;

% Dont forget to normalize the feature before prediction
pred_year_val = (pred_year .- mu)./sigma;

% Add first column
pred_year_norm = [1 pred_year_val];

% Calculate predicted value
pred_value = pred_year_norm * theta;

% Add predicted year to matrix so it will be ploted
X_norm = vertcat(X_norm, [1 pred_year_val]);
X = vertcat(X, [pred_year]);

pause;
% Plot linear regression line
plot(X, X_norm*theta, '-')

% Add legend
legend('Population', 'Linear Regression', 'Predicted Population', "location", "north");

pause;
% Plot predicted value with blue cross
plot(pred_year, pred_value, 'bx', 'MarkerSize', 10);

hold off;

fprintf('Predicted population in 2020 is %f\n ', pred_value);