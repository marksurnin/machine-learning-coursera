function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

hx = X * theta;

% Set theta(1) to 0 for regularization
reg_theta = theta;
reg_theta(1) = 0;


% Compute Cost
J = (1 /(2 * m)) * sum((hx - y) .^ 2) + (lambda / (2 * m)) * sum(reg_theta .^ 2);

% Compute Gradient

% why not sum(hx - y)?
grad = (1 / m) * X' * (hx - y) + (lambda / m) * reg_theta;






% =========================================================================

grad = grad(:);

end
