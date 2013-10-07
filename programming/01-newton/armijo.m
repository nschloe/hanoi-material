function alpha = armijo(f, x, gradFx, p, alpha0, sigma)
%ARMIJO    Armijo condition as step size strategy.

  % Make all vectors row vectors.
  x = x(:)';
  p = p(:)';

  maxiter = 100;
  alpha = alpha0;
  k = 0;
  while f(x+alpha*p) > f(x)+sigma*alpha*(p*gradFx(:))
      k = k+1;
      if k > maxiter
          error('armijo() failed.');
      end
      alpha = sigma*alpha;
  end

end
