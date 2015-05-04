Csh = 0.00088;
Z_line = 0.0455 + 0.1818i;
SD1 = 3.08 + 1.98i;
SD2 = 2.2 + 1.32i;
V1 = 0.98;
P21 = 1.1;

Y11 = 1 / Z_line + (Csh * 100 * pi / 2) * 1i;
Y12 = -1 / Z_line;
Y21 = -1 / Z_line;
Y22 = 1 / Z_line + (Csh * 100 * pi / 2) * 1i;

tolerrence = 1E-12;
deltaV = 1;
index = 1;
V2(index) = 1;

while deltaV > tolerrence
	S12(index) = V1 * conj(Y11 * V1 + Y12 * V2(index));
	S21(index) = P21 + 1i * imag( V2(index) * conj(Y21 * V1 + Y22 * V2(index)) );
	V2(index+1) = (1 / Y22) * (conj(S21(index) / V2(index)) - Y21 * V1);
	thetaRadian = angle(V2(index+1));
	thetaDegree = radtodeg(thetaRadian);
	V2(index+1) = cos(thetaRadian) + 1i * sin(thetaRadian);
	deltaV = abs(V2(index) - V2(index+1));
	index = index + 1;
end

SG1 = SD1 + S12;
SG2 = SD2 + S21;

fprintf('SG1 = %f + j%f pu\n', real(SG1(index-1)), imag(SG1(index-1)));
fprintf('SG2 = %f + j%f pu\n', real(SG2(index-1)), imag(SG2(index-1)));
fprintf('Theta = %f degress \n', thetaDegree);
