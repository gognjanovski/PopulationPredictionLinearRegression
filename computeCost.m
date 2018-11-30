function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost for each example 
%   using theta parametar for linear regression

% Number of training examples
m = length(y);
% Initialize cost variable
J = 0;

% Compute cost for each example
temp = ((X * theta) - y) .^ 2;
J = (1/(2*m)) * sum(temp);

end