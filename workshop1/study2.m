Z_line = 0.1818 + 0.7273i;
SD1 = 2.64 + 1.54i;
SD2 = 1.76 + 0.66i;
V2 = 1;
P12 = 1.98 - 2.64;

Y(1, 1) = 1 / Z_line;
Y(1, 2) = -1 / Z_line;
Y(2, 1) = -1 / Z_line;
Y(2, 2) = 1 / Z_line;

tolerrence = 1E-12;
deltaV = 1;
V1 = 1;

while deltaV > tolerrence
	I1 = Y(1, 1) * V1 + Y(1, 2) * V2;
	S12 = P12 + 1i * imag( V1 * conj(I1) );

	I2 = Y(2, 1) * V1 + Y(2, 2) * V2;
	S21 = V2 * conj(I2);

	V1plus1 = (1 / Y(1, 1)) * (conj(S12 / V1) - Y(1, 2) * V2);
	V1plus1 = V1plus1 / abs(V1plus1);

	theta = radtodeg(angle(V1plus1));

	deltaV = abs(V1 - V1plus1);
	
	V1 = V1plus1;
end

SG1 = SD1 + S12;
SG2 = SD2 + S21;

fprintf('SG1 = %f + j%f pu\n', real(SG1), imag(SG1));
fprintf('SG2 = %f + j%f pu\n', real(SG2), imag(SG2));
fprintf('Theta = %f degress \n', theta);
