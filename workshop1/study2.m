Z_TF = 0.1818 + 0.7273i;
SD1 = 2.64 + 1.54i;
SD2 = 1.76 + 0.66i;
V2 = 1;
P12 = 1.98 - 2.64;		% P12 = PG1 - PD1

% Y Matrix
Y(1, 1) = 1 / Z_TF;
Y(1, 2) = -1 / Z_TF;
Y(2, 1) = -1 / Z_TF;
Y(2, 2) = 1 / Z_TF;

tolerance = 1E-12;
deltaV = 1;		% the voltage difference between two V1
V1 = 1;			% first try of V1

while deltaV > tolerance
	I1 = Y(1, 1) * V1 + Y(1, 2) * V2;
	S12 = P12 + 1i * imag( V1 * conj(I1) );

	I2 = Y(2, 1) * V1 + Y(2, 2) * V2;
	S21 = V2 * conj(I2);

	V1plus1 = (1 / Y(1, 1)) * (conj(S12 / V1) - Y(1, 2) * V2);
	V1plus1 = V1plus1 / abs(V1plus1);		% ensure the absolute value of V1plus1 is 1

	theta = radtodeg(angle(V1plus1));

	deltaV = abs(V1 - V1plus1);
	
	V1 = V1plus1;
end

SG1 = SD1 + S12;
SG2 = SD2 + S21;

fprintf('SG1 = %f + j%f pu\n', real(SG1), imag(SG1));
fprintf('SG2 = %f + j%f pu\n', real(SG2), imag(SG2));
fprintf('SD1 = %f + j%f pu\n', real(SD1), imag(SD1));
fprintf('SD2 = %f + j%f pu\n', real(SD2), imag(SD2));
fprintf('S12 = %f + j%f pu\n', real(S12), imag(S12));
fprintf('S21 = %f + j%f pu\n', real(S21), imag(S21));
fprintf('Theta = %f degrees \n', theta);
