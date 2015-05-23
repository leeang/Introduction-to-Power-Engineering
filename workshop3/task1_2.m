close;

showTask1 = 1;
showTask2 = 1;

if showTask1
	plot(P00(:, 1), P00(:, 2), 'k');
	hold on;
	plot(P25(:, 1), P25(:, 2), 'k');
	hold on;
	plot(P50(:, 1), P50(:, 2), 'k');
	hold on;
	plot(P90(:, 1), P90(:, 2), 'k');
	hold on;
end

if showTask2
	hold on;
	plot(lead6(:, 1), lead6(:, 2), 'k.:');
	hold on;
	plot(lead8(:, 1), lead8(:, 2), 'k.:');
	hold on;
	plot(lag6(:, 1), lag6(:, 2), 'k.:');
	hold on;
	plot(lag8(:, 1), lag8(:, 2), 'k.:');
	hold on;
	plot(unity(:, 1), unity(:, 2), 'k.:');
	hold on;
end

axis([0 3 0 1.5]);
xlabel('i_F (pu)');
ylabel('|I_t| (pu)');

if showTask1
	text(P00(1, 1), P00(1, 2)+0.03, 'P=0', 'HorizontalAlignment', 'center');
	text(P25(1, 1), P25(1, 2)+0.03, 'P=0.25', 'HorizontalAlignment', 'center');
	text(P50(1, 1), P50(1, 2)+0.03, 'P=0.5', 'HorizontalAlignment', 'center');
	text(P90(1, 1), P90(1, 2)+0.03, 'P=0.9', 'HorizontalAlignment', 'center');
end

if showTask2
	pfYposition = lead6(1, 2)+0.03;

	text(0.5, pfYposition, 'power factor:');

	text(lead6(1, 1)-0.15, pfYposition, 'lead 0.6');
	text(lead8(1, 1)-0.1, pfYposition, 'lead 0.8');
	text(lag6(1, 1), pfYposition, 'lag 0.6');
	text(lag8(1, 1)-0.15, pfYposition, 'lag 0.8');
	text(unity(1, 1)-0.05, pfYposition, 'unity');
end
