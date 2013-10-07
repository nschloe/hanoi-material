function out = sphere(x)
%SPHERE    Sphere function, sum_{i=1}^n x_i^2.
  out = x(:,1).^2 + x(:,2).^2;
end
