VA_b = 100E6;
V_b = 11E3;
C_sh = 0.00088;

I_b = VA_b / V_b;
Z_b = V_b / I_b;

frequency = 50;

R = 0.0455 * Z_b;

X_L = 0.1818 * Z_b;
L = X_L / (2 * pi * frequency);

C_SI = C_sh / Z_b;

disp '=== Study 1 ===';
fprintf('[%e %e]\n', R, 2*R);
fprintf('[%e %e]\n', L, 2*L);
fprintf('[%e %e]\n', C_SI, 2*C_SI);


R = 0.1818 * Z_b;

X_L = 0.7273 * Z_b;
L = X_L / (2 * pi * frequency);

disp '=== Study 2 ===';
fprintf('[%e %e]\n', R, L);
fprintf('[%e %e]\n', 2*R, 2*L);

% Outcomes:
% === Study 1 ===
% [5.505500e-02 1.101100e-01]
% [7.002117e-04 1.400423e-03]
% [7.272727e-04 1.454545e-03]
% === Study 2 ===
% [2.199780e-01 2.801232e-03]
% [4.399560e-01 5.602464e-03]
