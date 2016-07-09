function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% Set the initial error to a very high value.
min_error = inf;

for C_val = values
    for sigma_val = values
        fprintf('Train and evaluate on cross-val set for [C, sigma] = [%f %f]\n', C_val, sigma_val);
        % Syntax from line 108 in ex6.m
        model = svmTrain(X, y, C_val, @(x1, x2) gaussianKernel(x1, x2, sigma_val));
        errs = mean(double(svmPredict(model, Xval) ~= yval));
        if errs < min_error
            min_error = errs;
            C = C_val;
            sigma = sigma_val;
            fprintf('[C, sigma] = [%f %f]\n', C, sigma);
        end
    end
end

fprintf('Best value [C, sigma] = [%f %f] with prediction error = %f.', C, sigma, min_error);

% =========================================================================

end
