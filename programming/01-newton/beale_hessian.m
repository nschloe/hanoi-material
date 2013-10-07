function out = beale_hessian(x)
%BEALE_HESSIAN    Hessian of Beale's function.

  out = [ 2*(-1.0 + x(2)  ) * (-1.0 + x(2)  )  ...
        + 2*(-1.0 - x(2)^2) * (-1.0 - x(2)^2)  ...
        + 2*(-1.0 + x(2)^3) * (-1.0 + x(2)^3), ...
          2*x(1) * (-1.0 + x(2)) + 2*(1.5   - x(1) + x(1)*x(2)) ...
        - 4*x(1)*x(2) * (-1.0 - x(2)^2)
        - 2*(2.25  - x(1) - x(1)*x(2)^2) * 2*x(2)  ...
        + 6**x(1)*x(2)^2 * (-1.0 + x(2)^3)
        + 2*(2.625 - x(1) + x(1)*x(2)^3) * 3*x(2)^2; ...
          2*(-1.0 + x(2)) * x(1) + 2*(1.5 - x(1) + x(1)*x(2)) ...
        + 2*(-1.0 - x(2)^2) * (-2*x(1)*x(2)  ) ...
        + 2*(2.25  - x(1) - x(1)*x(2)^2) * (-2*x(2)  ) ...
        + 2*(-1.0 + x(2)^3) * ( 3*x(1)*x(2)^2) ...
        + 2*(2.625 - x(1) + x(1)*x(2)^3) * ( 3*x(2)^2), ...
          2*x(1)^2 ...
        + 2*(-2*x(1)*x(2)) * (-2*x(1)*x(2)  ) ...
        + 2*(2.25  - x(1) - x(1)*x(2)^2) * (-2*x(1)  ) ...
        + 2*(3*x(1)*x(2)^2) * ( 3*x(1)*x(2)^2) ...
        + 2*(2.625 - x(1) + x(1)*x(2)^3) * ( 6*x(1)*x(2)) ...
        ];

end
