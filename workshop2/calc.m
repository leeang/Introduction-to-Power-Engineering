%%Q1
V_1 = 230;
W_0 = 25;
I_o = 0.29;

I_oc = W_0 / V_1;
R = V_1 / I_oc;

I_om = sqrt(I_o^2 - I_oc^2);
X = V_1 / I_om;

%%Q2
V_1 = 13;
W_0 = 65;
A_1 = 6.5;
A_2 = 13.6;

R_eq = W_0 / A_1^2;

X_eq = sqrt(V_1^2 - (R_eq*A_1)^2) / A_1;

R_1 = 0.64;

R_2_prime = R_eq - R_1;

alpha = 230 / 110;

R_2 = R_2_prime / alpha^2;

ratio = 0.64 / 0.18;

X_2 = X_eq / (ratio + alpha^2);
X_1 = X_eq - X_2 * alpha^2;
