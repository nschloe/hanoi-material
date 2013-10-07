function out = beale(x)
%BEALE    Beale's function, cf.
% <https://en.wikipedia.org/wiki/Test_functions_for_optimization>.

  out = (1.5   - x(:,1) + x(:,1).*x(:,2)   ).^2 ...
      + (2.25  - x(:,1) - x(:,1).*x(:,2).^2).^2 ...
      + (2.625 - x(:,1) + x(:,1).*x(:,2).^3).^2;

end
