function [X, resvec, flag] = ...
    steepestDescent(f, gradF, x0, alpha0, tau, tol, maxiter)
%STEEPESTDESCENT    Solve a nonlinear equation f=0 using the steepest descent.
%   STEEPESTDESCENT(f, gradF, x0, tol) solves the equation f(x)=0 up to the
%   tolerance tol using the initial guess x0.

  X = x0(:)';
  resvec = [norm(f(X(end,:)))];
  alpha = alpha0;
  k = 0;
  while resvec(end) > tol
      k = k+1;
      if k > maxiter
          flag = 1;
          return;
      end
      p = -gradF(X(end,:));
      p = p(:)';
      % Choose a step size.
      alpha0 = 1.0;
      sigma = 0.4;
      alpha = armijo(f, X(end,:), gradF(X(end,:)), p, alpha0, sigma)
      %% Backtracking line search.
      %alpha = alpha0;
      %while ~all(wolfe(f, X(end,:), gradF, alpha, p))
      %    alpha = tau*alpha;
      %end
      X(end+1,:) = X(end,:) + alpha * p;
      resvec(end+1) = norm(f(X(end,:)))
  end

  flag = 0;

end
% -----------------------------------------------------------------------------
function [armijo, curvature] = wolfe(f, x, gradF, alpha, p)
  % Wolfe conditions, cf. <https://en.wikipedia.org/wiki/Wolfe_conditions>.

  c1 = 1.0e-4;
  c2 = 0.9;

  gradFx = gradF(x);
  pGradFx = p(:)'*gradFx;
  armijo = (f(x+alpha*p) < f(x) + c1*alpha*pGradFx);
  curvature = (p(:)'*gradF(x+alpha*p) > c2 * pGradFx);

end
% -----------------------------------------------------------------------------
