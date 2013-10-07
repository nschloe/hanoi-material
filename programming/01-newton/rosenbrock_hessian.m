function out = rosenbrock_hessian(x)
%ROSENBROCK_HESSIAN    Hessian matrix of the Rosenbrock function.
  out = [2 + 800*x(1)^2 - 400*(x(2)-x(1)^2), -400*x(1); ...
         -400*x(1), 200 ...
        ];
end