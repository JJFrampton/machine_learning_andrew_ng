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

fprintf(['theta\n'])
size(theta)
fprintf(['X\n'])
size(X)


m = size(X,1);
sq_errors = 1/(2*m) * ((X * theta - y)' * (X * theta - y));
%sq_errors = 1/(2*m) * (X * theta - y) .^2;

%dont reg theta0
%reg_theta = theta;
%reg_theta = theta';
%reg_theta(:,1) = zeros(size(reg_theta, 1), 1);
%reg = lambda / (2*m) * sum(reg_theta * reg_theta');
%reg = lambda / (2*m) * (sum(theta.^2)-theta(1,1)^2)/(2*m);
%reg = lambda/(m) * sum(sum(reg_theta));

%example
%J = J + lambda / ( 2 * m ) * sum(theta(2:end,:) .^ 2);

%J = sq_errors + reg;

h = X * theta;
%these are equal
error1 = sum(((h-y).^2));
error1 = (h-y)' * (h-y);

error3 = (1/(2*m)) * error1;
reg = lambda * (1/(2*m)) * sum(theta(2:end) .^ 2);

J = error3 + reg;

grad = (X' * (h-y)) / m;
theta_0 = theta;
theta_0(1,1)=0;
grad = grad + (lambda/m) * theta_0 ;


%J = fmincg()






% =========================================================================

grad = grad(:);

end
