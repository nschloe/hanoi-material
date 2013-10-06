function out = rosenbrock_gradient(x)
%ROSENBROCK_GRADIENT    Gradient of the Rosenbrock function.

  out = [-2*(1-x(1)) - 400*(x(2) - x(1)^2) * x(1); ...
         200*(x(2) - x(1)^2) ...
        ];
return
