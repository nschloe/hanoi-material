% Main routine.

f = @rosenbrock;

% Plot the function.
doPlot = true;
if doPlot
    tx = linspace(-2, 2, 60);
    ty = linspace(-1, 3, 60);
    [xx, yy] = meshgrid (tx, ty);
    zz = rosenbrock([xx(:), yy(:)]);
    zz = reshape(zz, size(xx,1), size(xx,2));
    %surf(xx, yy, zz);
    contourf(xx, yy, zz);
end

%x0 = [1.2, 1.2];
x0 = [-1.2, 1];

tol = 1.0e-12;
gradientF = @rosenbrock_gradient;
gradientF = @rosenbrock_gradient;
hessianF = @rosenbrock_hessian;
[x, resvec] = newton(gradientF, hessianF, x0, tol);

figure;
semilogy(resvec)

if doPlot
    figure;
    contourf(xx, yy, zz);
    hold on;
    plot(x(:,1), x(:,2), 'r-x');
    hold off;
end
