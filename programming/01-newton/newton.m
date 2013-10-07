function [X, flag, resvec] = newton(f, gradF, hessianF, x0, tol, maxit)
%NEWTON    Solve a nonlinear equation f=0 using Newton's method.
%   NEWTON(f, J, x0, tol) solves the equation f(x)=0 up to the tolerance tol
%   using the initial guess x0.

  X = x0(:)';
  gradFx = gradF(X(end,:));
  resvec = [norm(gradFx)];
  k = 0;
  while resvec(end) > tol
      k = k+1;
      if k > maxit
          k, maxit
          warning('Newton''s method did not converge.');
          flag = 1;
          return;
      end
      p = -hessianF(X(end,:)) \ gradFx;
      p = p(:)';
      % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      % Armijo rule.
      alpha0 = 1.0;
      sigma = 0.4;
      alpha = armijo(f, X(end,:), gradFx, p, alpha0, sigma);
      % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      %alpha = 1.0;
      % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      X(end+1,:) = X(end,:) + alpha * p;
      gradFx = gradF(X(end,:));
      resvec(end+1) = norm(gradFx);
  end

  flag = 0;
  return;
end
