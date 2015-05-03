Csh = 0.00088;
Z_line = 0.0455 + 0.1818i;
SD1 = 3.08 + 1.98i;
SD2 = 2.2 + 1.32i;
V1 = 0.98;
P21 = 1.1;

Y(1, 1) = 1 / Z_line + (Csh * 100 * pi / 2) * 1i;
Y(1, 2) = -1 / Z_line;
Y(2, 1) = -1 / Z_line;
Y(2, 2) = 1 / Z_line + (Csh * 100 * pi / 2) * 1i;

tolerrence = 1E-12;
deltaV = 1;
V2 = 1;

while deltaV > tolerrence
	I1 = Y(1, 1) * V1 + Y(1, 2) * V2;
	S12 = V1 * conj(I1);

	I2 = Y(2, 1) * V1 + Y(2, 2) * V2;
	S21 = P21 + 1i * imag( V2 * conj(I2) );

	V2plus1 = (1 / Y(2, 2)) * (conj(S21 / V2) - Y(2, 1) * V1);
	V2plus1 = V2plus1 / abs(V2plus1);

	theta = radtodeg(angle(V2plus1));

	deltaV = abs(V2 - V2plus1);
	
	V2 = V2plus1;
end

SG1 = SD1 + S12;
SG2 = SD2 + S21;

fprintf('SG1 = %f + j%f pu\n', real(SG1), imag(SG1));
fprintf('SG2 = %f + j%f pu\n', real(SG2), imag(SG2));
fprintf('Theta = %f degress \n', theta);
