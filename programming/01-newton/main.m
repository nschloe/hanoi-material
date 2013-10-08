% Main routine.
% -----------------------------------------------------------------------------
%problem = beale();
problem = rosenbrock();
%problem = sphere();

% Plot the function.
doPlot = true;
if doPlot
    tx = linspace(-4, 4, 60);
    %ty = linspace(-1, 3, 60);
    ty = linspace(-4, 4, 60);
    [xx, yy] = meshgrid(tx, ty);
    zz = problem.f([xx(:), yy(:)]);
    zz = reshape(zz, size(xx,1), size(xx,2));
    %surf(xx, yy, zz);
    contourf(xx, yy, zz);
end
% -----------------------------------------------------------------------------
% Define the problem
x0 = [1.2, 1.2];
%x0 = [-1.2, 1];
% -----------------------------------------------------------------------------
tol = 1.0e-12;
maxit = 1000;
% Steepest descent.
alpha0 = 1.0;
[x_sd, resvec_sd] = steepestDescent(problem.f, problem.gradient, ...
                                    x0, alpha0, tol, maxit);
% Conjugate gradient.
alpha0 = 1.0;
[x_cg, resvec_cg] = conjugateGradient(problem.f, problem.gradient, ...
                                      x0, alpha0, tol, maxit);
% Newton's method.
[x_n, flag, resvec_n] = newton(problem.f, problem.gradient, problem.hessian,...
                               x0, tol, maxit);
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
%matlab2tikz('test.tex', 'standalone', true)
% -----------------------------------------------------------------------------
