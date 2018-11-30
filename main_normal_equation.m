% Load Population Data
statistics_data = getCsvData('swe_pop_2007_2017.csv');

% Convert cell to matrix
X = cell2mat(statistics_data(:,1));
y = cell2mat(statistics_data(:,2));

% Convert matrix values to double
X = double(X);
y = double(y);

hold on;
% Set the x-axis label
xlabel('Year'); 
% Set the y-axis label
ylabel('Population'); 

% Plot population data
plot(X, y, 'rx', 'MarkerSize', 10);

m = length(y);
% Add ones column
X = [ones(m, 1) X];

% Gradient Descent with Normal Equation
theta = (pinv(X'*X))*X'*y

% Predict population for 2020
pred_year = 2020;
pred_year_val = [1 2020];

% Calculate predicted value
pred_value = pred_year_val * theta;

% Add predicted year to matrix so it will be ploted on the graph
X = vertcat(X, pred_year_val);

fprintf('Press any key to continue\n');
pause;
% Plot linear regression line
plot(X(:,2), X*theta, '-')

fprintf('Press any key to continue\n');
pause;
% Plot predicted value with blue cross
plot(pred_year, pred_value, 'bx', 'MarkerSize', 10);

% Add legend
legend('Population', 'Linear Regression', 'Predicted Population', "location", "north");

hold off;

fprintf('Predicted population in 2020 is %d people\n ', int64(pred_value));