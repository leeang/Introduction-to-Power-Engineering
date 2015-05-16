R_s = 2.85E-03;
L_l = 0.15;
L_d = 1.536;
L_q = 1.494;
R_f = 0.0006;
L_lfd = 0.165;

L_md = L_d - L_l;
L_mq = L_q - L_l;

L_fd = L_lfd + L_md;

disp('Stator');
fprintf('[%e %f %f %f]\n', R_s, L_l, L_md, L_mq);

disp('Field');
fprintf('[%f %f]\n', R_f, L_lfd);
