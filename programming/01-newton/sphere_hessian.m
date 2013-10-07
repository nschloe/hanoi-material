function out = sphere_hessian(x)
%SPHERE_HESSIAN    Gradient of the sphere function.
  out = [2*x(1), 2*x(2)];
  out = [x(1), 0.0; ...
         0.0, x(2)];
end
