function out = rosenbrock(x)
  % Rosenbrock function, cf.
  % <https://en.wikipedia.org/wiki/Rosenbrock_function>.

  out = (1-x(:,1)).^2 + 100*(x(:,2) - x(:,1).^2).^2;

end
