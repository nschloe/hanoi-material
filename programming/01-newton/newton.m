function [X, resvec] = newton(f, J, x0, tol)
  % Newton's method for solving nonlinear equation systems.

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
