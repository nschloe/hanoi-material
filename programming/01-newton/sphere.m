% -----------------------------------------------------------------------------
function problem = sphere()

    problem.f = @f;
    problem.gradient = @gradient;
    problem.hessian = @hessian;

end
% -----------------------------------------------------------------------------
function out = f(x)
%SPHERE    Sphere function, sum_{i=1}^n x_i^2.
  out = x(:,1).^2 + x(:,2).^2;
end
% -----------------------------------------------------------------------------
function out = gradient(x)
%SPHERE_GRADIENT    Gradient of the sphere function.
  out = [2*x(:,1), 2*x(:,2)];
  out = out';
end
% -----------------------------------------------------------------------------
function out = hessian(x)
%SPHERE_HESSIAN    Hessian of the sphere function.
  out = [2.0, 0.0; ...
         0.0, 2.0];
end
% -----------------------------------------------------------------------------
