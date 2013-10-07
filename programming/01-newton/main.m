% Main routine.
% -----------------------------------------------------------------------------
f = @beale;
%f = @rosenbrock;
%f = @sphere;

% Plot the function.
doPlot = true;
if doPlot
    tx = linspace(-4, 4, 60);
    %ty = linspace(-1, 3, 60);
    ty = linspace(-4, 4, 60);
    [xx, yy] = meshgrid(tx, ty);
    zz = f([xx(:), yy(:)]);
    zz = reshape(zz, size(xx,1), size(xx,2));
    %surf(xx, yy, zz);
    contourf(xx, yy, zz);
end
% -----------------------------------------------------------------------------
% Define the problem
gradientF = @beale_gradient;
hessianF = @beale_hessian;
%gradientF = @rosenbrock_gradient;
%hessianF = @rosenbrock_hessian;
%gradientF = @sphere_gradient;
%hessianF = @sphere_hessian;
x0 = [1.2, 1.2];
%x0 = [-1.2, 1];
% -----------------------------------------------------------------------------
tol = 1.0e-12;
maxit = 1000;
% Steepest descent.
[x_sd, resvec_sd] = steepestDescent(f, gradientF, x0, alpha0, tol, maxit);
% Conjugate gradient.
[x_cg, resvec_cg] = conjugateGradient(f, gradientF, x0, alpha0, tol, maxit);
% Newton's method.
%[x_n, flag, resvec_n] = newton(f, gradientF, hessianF, x0, tol, maxit);
% -----------------------------------------------------------------------------
% Post processing: some plots.
figure;
semilogy(resvec_sd, 'r')
hold on;
semilogy(resvec_cg, 'g')
semilogy(resvec_n, 'b')
hold off;
if doPlot
    figure;
    contourf(xx, yy, zz);
    hold on;
    plot(x_sd(:,1), x_sd(:,2), 'r-x');
    hold off;
end
% -----------------------------------------------------------------------------
