problem = sphere();
%problem = rosenbrock();

tx = linspace(-2, 2, 60);
ty = linspace(-1, 3, 60);
%ty = linspace(-4, 4, 60);
[xx, yy] = meshgrid(tx, ty);
zz = problem.f([xx(:), yy(:)]);
zz = reshape(zz, size(xx,1), size(xx,2));

%
%surf(xx, yy, zz);
%
contourf(xx, yy, zz);
uu = problem.gradient([xx(:), yy(:)])';
uu = reshape(uu, size(xx,1), size(xx,2), 2);
hold on;
quiver(xx, yy, uu(:,:,1), uu(:,:,2));
hold off;
%
