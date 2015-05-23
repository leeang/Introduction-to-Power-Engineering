S = 0.25 - 0.6j;
phi_pf = radtodeg(angle(S));

V_t = 1;

I_t = conj(S / V_t);

R_s = 2.85E-3;
X_q = 1.494;
X_d = 1.536;
L_fd = 1.551;
L_lfd = 0.165;
X_dF = L_fd - L_lfd;

Eq_Re = abs(V_t) + R_s * abs(I_t) * cosd(phi_pf) + X_q * abs(I_t) * sind(phi_pf);
Eq_Im = X_q * abs(I_t) * cosd(phi_pf) - R_s * abs(I_t) * sind(phi_pf);

delta_i = atand(Eq_Im/Eq_Re);

v_q = sqrt(2) * abs(V_t) * cosd(delta_i);
i_q = sqrt(2) * abs(I_t) * cosd(delta_i+phi_pf);

i_d = sqrt(2) * abs(I_t) * sind(delta_i+phi_pf);

i_F = (v_q + R_s * i_q + X_d * i_d) / X_dF;

fprintf('v_q=%f\n', v_q);
fprintf('i_q=%f\n', i_q);
fprintf('i_q(RMS)=%f\n', i_q/sqrt(2));

fprintf('i_d=%f\n', i_d);
fprintf('i_d(RMS)=%f\n', i_d/sqrt(2));

fprintf('i_t(RMS)=%f\n', abs(I_t));

fprintf('i_F=%f\n', abs(i_F));

fprintf('delta=%f\n', abs(delta_i));
