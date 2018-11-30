function theta = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta 
% by making num_iters number of iterations with step alpha

% Initialize variables
m = length(y);

for iter = 1:num_iters
    % Calculate step by formula
    step = (alpha/m);
    % Calculate difference between expected and predicted values
    matrix = (X * theta) - y;
    % Adjust the theta values
    theta = theta - (step * (X' * matrix)) ;
end

end
