function [X, resvec] = newton(f, J, x0, tol)
% NEWTON    Solve a nonlinear equation f=0 using Newton's method.
%   NEWTON(f, J, x0, tol) solves the equation f(x)=0 up to the tolerance tol
%   using the initial guess x0.

  X = x0(:)';
  fx = f(X(end,:));
  resvec = [norm(fx)];
  while resvec(end) > tol
      dx = -J(X(end,:)) \ fx;
      X(end+1,:) = X(end,:) + dx(:)';
      fx = f(X(end,:));
      resvec(end+1) = norm(fx);
  end

end
