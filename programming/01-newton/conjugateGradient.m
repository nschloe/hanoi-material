function [X, resvec, flag] = ...
    conjugateGradient(f, gradF, x0, alpha0, tol, maxit)
%CONJUGATEGRADIENT    Solve a nonlinear equation f=0 using the nonlinear
% conjudate gradient method.

  X = x0(:)';
  gradFx = gradF(X(end,:));
  resvec = [norm(gradFx)];
  k = 0;
  while resvec(end) > tol
      k = k+1;
      if k > maxit
          k, maxit
          warning('Nonliner conjugate gradient method did not converge.');
          flag = 1;
          return;
      end
      % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      % Choose the descent direction.
      if k == 1
          sd0 = -gradFx(:)';
          p = sd0(:)';
      else
          sd_1 = sd0;
          sd0 = -gradFx(:)';
          % Fletcher-Reeves.
          beta = (sd0*sd0') ...
               / (sd_1*sd_1');
          %% Polak-Ribière.
          %beta = (sd(end,:)*(sd(end,:)-sd(end-1,:))') ...
          %     / (sd(end-1,:)*sd(end-1,:)');
          %% Hestenes-Stiefel.
          %beta = - (sd(end,:)*(sd(end,:)-sd(end-1,:))') ...
          %       / (s(end,:) *(sd(end,:)-sd(end-1,:))');
          p = sd0(:)' + beta*p(:)';
      end
      % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      % Armijo rule.
      alpha0 = 1.0;
      sigma = 0.4;
      alpha = armijo(f, X(end,:), gradFx, p, alpha0, sigma);
      % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      X(end+1,:) = X(end,:) + alpha * p;
      gradFx = gradF(X(end,:));
      resvec(end+1) = norm(gradFx);
  end

  flag = 0;
  return;
end
