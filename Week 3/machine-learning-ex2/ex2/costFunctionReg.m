function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
H = sigmoid(X*theta);
grad(1) = (1/m)*(H - y)'*X(:,1);
J = -((1/m)*sum((y'*log(H) + (1-y)'*log(1-H))))+(lambda/(2*m))*(sum((theta(2:size(theta))).^2));
grad([2 3]) = ((1/m)*(X(:,[2 3]))'*(H-y)) + (lambda/m)*theta([2 3]);



% =============================================================

end
