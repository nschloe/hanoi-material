% Main routine.
% -----------------------------------------------------------------------------
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
% -----------------------------------------------------------------------------
x0 = [1.2, 1.2];
%x0 = [-1.2, 1];

tol = 1.0e-12;
maxit = 100;
gradientF = @rosenbrock_gradient;
gradientF = @rosenbrock_gradient;
hessianF = @rosenbrock_hessian;
%% Steepest descent.
%alpha0 = 1.0;
%tau = 0.5;
%[x, resvec] = steepestDescent(f, gradientF, x0, alpha0, tau, tol, maxit);
% Newton's method.
[x, flag, resvec] = newton(f, gradientF, hessianF, x0, tol, maxit);
if flag ~= 0
    plot(resvec)
    pause(10)
    error('Newton did not converge.')
end
% -----------------------------------------------------------------------------
% Post processing: some plots.
figure;
semilogy(resvec)
if doPlot
    figure;
    contourf(xx, yy, zz);
    hold on;
    plot(x(:,1), x(:,2), 'r-x');
    hold off;
end
% -----------------------------------------------------------------------------
