function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE returns normalized value for each feature 

% Initialize variables
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

m = size(X, 2);
% For each feature
for iter = 1:m
    % Compute mean
    mu(iter) = mean(X_norm(:, iter));
    % Compute standard deviation
    sigma(iter) = std(X_norm(:, iter));

    % Extract mean and devide each feature by standard deviation
    X_norm(:, iter) = (X_norm(:, iter) - mu(iter)) / sigma(iter);
end

end