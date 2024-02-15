%% General Info
% Aditya Bangalore
% October 1, 2023
% VT Space Instrumentation Laboratory
% GRIDS Calibration Up/Down Sweep Polynomial Fitting Function Generator

%% Housekeeping
clear;
clc;

%% Collect all data in arrays
A_up = readmatrix("Coll_A_CalData_Up.xlsx");
A_dn = readmatrix("Coll_A_CalData_Dn.xlsx");
B_up = readmatrix("Coll_B_CalData_Up.xlsx");
B_dn = readmatrix("Coll_B_CalData_Dn.xlsx");
C_up = readmatrix("Coll_C_CalData_Up.xlsx");
C_dn = readmatrix("Coll_C_CalData_Dn.xlsx");
D_up = readmatrix("Coll_D_CalData_Up.xlsx");
D_dn = readmatrix("Coll_D_CalData_Dn.xlsx");

% Input currents same for all collectors
input_currents_nA = A_up(:,1);

% Input currents to see effect of omitting 0.2 nA from D downsweep, in
% order to assess the effect of the bad data at 0.2 nA for D upsweep.
input_currents_omit200pA = [A_up(1:3,1); A_up(5:14,1)];

% Medians
A_med_up = A_up(:,2);
A_med_dn = A_dn(:,2);
B_med_up = B_up(:,2);
B_med_dn = B_dn(:,2);
C_med_up = C_up(:,2);
C_med_dn = C_dn(:,2);
D_med_up = D_up(:,2);
D_med_dn = D_dn(:,2);

% Medians for 0.2 nA omission 
D_med_dn_omit = [D_med_dn(1:3); D_med_dn(5:14)];
D_med_up_omit = [D_med_up(1:3); D_med_up(5:14)];

% Means
A_mean_up = A_up(:,3);
A_mean_dn = A_dn(:,3);
B_mean_up = B_up(:,3);
B_mean_dn = B_dn(:,3);
C_mean_up = C_up(:,3);
C_mean_dn = C_dn(:,3);
D_mean_up = D_up(:,3);
D_mean_dn = D_dn(:,3);

% Sigmas
A_sigma_up = A_up(:,4);
A_sigma_dn = A_dn(:,4);
B_sigma_up = B_up(:,4);
B_sigma_dn = B_dn(:,4);
C_sigma_up = C_up(:,4);
C_sigma_dn = C_dn(:,4);
D_sigma_up = D_up(:,4);
D_sigma_dn = D_dn(:,4);

%% Plot raw calibration data (medians)

% Collector A Upsweep
figure(1);
scatter(A_med_up, input_currents_nA, 'LineWidth', 2);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
xlim([min(A_med_up)-10 max(A_med_up)+10]);
ylim([10e-10 10e4]);
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
title("Positive Valued IDM Current Medians, Collector A Upsweep");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector A Downsweep
figure(2);
scatter(A_med_dn, input_currents_nA, 'LineWidth', 2);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
xlim([min(A_med_dn)-10 max(A_med_dn)+10]);
ylim([10e-10 10e4]);
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
title("Positive Valued IDM Current Medians, Collector A Downsweep");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector B Upsweep
figure(3);
scatter(B_med_up, input_currents_nA, 'LineWidth', 2);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
xlim([min(B_med_up)-10 max(B_med_up)+10]);
ylim([10e-10 10e4]);
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
title("Positive Valued IDM Current Medians, Collector B Upsweep");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector B Downsweep
figure(4);
scatter(B_med_dn, input_currents_nA, 'LineWidth', 2);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
xlim([min(B_med_dn)-10 max(B_med_dn)+10]);
ylim([10e-10 10e4]);
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
title("Positive Valued IDM Current Medians, Collector B Downsweep");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector C Upsweep
figure(5);
scatter(C_med_up, input_currents_nA, 'LineWidth', 2);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
xlim([min(C_med_up)-10 max(C_med_up)+10]);
ylim([10e-10 10e4]);
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
title("Positive Valued IDM Current Medians, Collector C Upsweep");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector C Downsweep
figure(6);
scatter(C_med_dn, input_currents_nA, 'LineWidth', 2);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
xlim([min(C_med_dn)-10 max(C_med_dn)+10]);
ylim([10e-10 10e4]);
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
title("Positive Valued IDM Current Medians, Collector C Downsweep");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector D Upsweep
figure(7);
scatter(D_med_up, input_currents_nA, 'LineWidth', 2);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
xlim([min(D_med_up)-10 max(D_med_up)+10]);
ylim([10e-10 10e4]);
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
title("Positive Valued IDM Current Medians, Collector D Upsweep");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector D Downsweep
figure(8);
scatter(D_med_dn, input_currents_nA, 'LineWidth', 2);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
xlim([min(D_med_dn)-10 max(D_med_dn)+10]);
ylim([10e-10 10e4]);
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
title("Positive Valued IDM Current Medians, Collector D Downsweep");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector D Upsweep (0.2 nA omission)
figure(9);
scatter(D_med_up_omit, input_currents_omit200pA, 'LineWidth', 2);
xlim([min(D_med_up)-10 max(D_med_up)+10]);
ylim([10e-10 10e4]);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
title("Positive Valued IDM Current Medians, D Upsweep (0.2 nA omission)");
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

% Collector D Downsweep (0.2 nA omission)
figure(10);
scatter(D_med_dn_omit, input_currents_omit200pA, 'LineWidth', 2);
xlim([min(D_med_dn)-10 max(D_med_dn)+10]);
ylim([10e-10 10e4]);
set(gca, 'yscal', 'log', 'fontsize', 14);
set(gca, 'xscal', 'log');
hold on;
title("Positive Valued IDM Current Medians, D Downsweep (0.2 nA omission)");
ylabel("Input Current (nA)");
xlabel("Measured Median Current (nA)");
grid on;
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on', ...
         'GridColor', 'k', 'MinorGridAlpha', 0.5, 'MinorGridLineStyle', '-', ...
         'MinorGridColor', [0.3,0.3,0.3], 'GridAlpha', 0.8, 'LineWidth', 1.2);

%% Get polynomial fits

% Collector A Upsweep
figure(1);
n_A_up = 4;
A_up_med_poly = polyfit(A_med_up, input_currents_nA, n_A_up);
syms iAu;
fiAu = 0;
for i = 1:n_A_up+1
    fiAu = fiAu + A_up_med_poly(i)*iAu^(n_A_up-(i-1));
end
fplot(fiAu, 'LineWidth', 2);
A_up_polystr = strcat("(", num2str(A_up_med_poly(1)), ")x^4 + (", num2str(A_up_med_poly(2)), ")x^3 + (", num2str(A_up_med_poly(3)), ")x^2 + (", num2str(A_up_med_poly(4)), ")x - ", num2str(-1*A_up_med_poly(5)));
legend("Raw Cal Data", A_up_polystr);

% Collector A Downsweep
figure(2);
n_A_dn = 4;
A_dn_med_poly = polyfit(A_med_dn, input_currents_nA, n_A_dn);
syms iAd;
fiAd = 0;
for i = 1:n_A_dn+1
    fiAd = fiAd + A_dn_med_poly(i)*iAd^(n_A_dn-(i-1));
end
fplot(fiAd, 'LineWidth', 2);
A_dn_polystr = strcat("(", num2str(A_dn_med_poly(1)), ")x^4 + (", num2str(A_dn_med_poly(2)), ")x^3 + (", num2str(A_dn_med_poly(3)), ")x^2 + (", num2str(A_dn_med_poly(4)), ")x - ", num2str(-1*A_dn_med_poly(5)));
legend("Raw Cal Data Downsweep", A_dn_polystr);

% Collector B Upsweep
figure(3);
n_B_up = 4;
B_up_med_poly = polyfit(B_med_up, input_currents_nA, n_B_up);
syms iBu;
fiBu = 0;
for i = 1:n_B_up+1
    fiBu = fiBu + B_up_med_poly(i)*iBu^(n_B_up-(i-1));
end
fplot(fiBu, 'LineWidth', 2);
B_up_polystr = strcat("(", num2str(B_up_med_poly(1)), ")x^4 + (", num2str(B_up_med_poly(2)), ")x^3 + (", num2str(B_up_med_poly(3)), ")x^2 + (", num2str(B_up_med_poly(4)), ")x - ", num2str(-1*B_up_med_poly(5)));
legend("Raw Cal Data", B_up_polystr);

% Collector B Downsweep
figure(4);
n_B_dn = 6;
B_dn_med_poly = polyfit(B_med_dn, input_currents_nA, n_B_dn);
syms iBd;
fiBd = 0;
for i = 1:n_B_dn+1
    fiBd = fiBd + B_dn_med_poly(i)*iBd^(n_B_dn-(i-1));
end
fplot(fiBu, 'LineWidth', 2);
B_dn_polystr = strcat("(", num2str(B_dn_med_poly(1)), ")x^6 + (", num2str(B_dn_med_poly(2)), ")x^5 + (", num2str(B_dn_med_poly(3)), ")x^4 + (", num2str(B_dn_med_poly(4)), ")x^3 + (", num2str(B_dn_med_poly(5)), ")x^2 + (", num2str(B_dn_med_poly(6)), ")x - ", num2str(-1*B_dn_med_poly(7)));
legend("Raw Cal Data", B_dn_polystr);

% Collector C Upsweep
figure(5);
n_C_up = 4;
C_up_med_poly = polyfit(C_med_up, input_currents_nA, n_C_up);
syms iCu;
fiCu = 0;
for i = 1:n_C_up+1
    fiCu = fiCu + C_up_med_poly(i)*iCu^(n_C_up-(i-1));
end
fplot(fiCu, 'LineWidth', 2);
C_up_polystr = strcat("(", num2str(C_up_med_poly(1)), ")x^4 + (", num2str(C_up_med_poly(2)), ")x^3 + (", num2str(C_up_med_poly(3)), ")x^2 + (", num2str(C_up_med_poly(4)), ")x - ", num2str(-1*C_up_med_poly(5)));
legend("Raw Cal Data", C_up_polystr);

% Collector C Downsweep
figure(6);
n_C_dn = 4;
C_dn_med_poly = polyfit(C_med_dn, input_currents_nA, n_C_dn);
syms iCd;
fiCd = 0;
for i = 1:n_C_dn+1
    fiCd = fiCd + C_dn_med_poly(i)*iCd^(n_C_dn-(i-1));
end
fplot(fiCd, 'LineWidth', 2);
C_dn_polystr = strcat("(", num2str(C_dn_med_poly(1)), ")x^4 + (", num2str(C_dn_med_poly(2)), ")x^3 + (", num2str(C_dn_med_poly(3)), ")x^2 + (", num2str(C_dn_med_poly(4)), ")x - ", num2str(-1*C_dn_med_poly(5)));
legend("Raw Cal Data", C_dn_polystr);

% Collector D Upsweep
% Bad data

% Collector D Downsweep
figure(8);
n_D_dn = 4;
D_dn_med_poly = polyfit(D_med_dn, input_currents_nA, n_D_dn);
syms iDd;
fiDd = 0;
for i = 1:n_D_dn+1
    fiDd = fiDd + D_dn_med_poly(i)*iDd^(n_D_dn-(i-1));
end
fplot(fiDd, 'LineWidth', 2);
D_dn_polystr = strcat("(", num2str(D_dn_med_poly(1)), ")x^4 + (", num2str(D_dn_med_poly(2)), ")x^3 + (", num2str(D_dn_med_poly(3)), ")x^2 + (", num2str(D_dn_med_poly(4)), ")x - ", num2str(-1*D_dn_med_poly(5)));
legend("Raw Cal Data", D_dn_polystr);

% Collector D Upsweep (0.2 nA omission)
figure(9);
n_D_up_omit = 5;
D_up_med_omit_poly = polyfit(D_med_up_omit, input_currents_omit200pA, n_D_up_omit);
syms iDuO;
fiDuO = 0;
for i = 1:n_D_up_omit+1
    fiDuO = fiDuO + D_up_med_omit_poly(i)*iDuO^(n_D_up_omit-(i-1));
end
fplot(fiDuO, 'LineWidth', 2);
D_up_omit_polystr = strcat("(", num2str(D_up_med_omit_poly(1)), ")x^5 + (", num2str(D_up_med_omit_poly(2)), ")x^4 + (", num2str(D_up_med_omit_poly(3)), ")x^3 + (", num2str(D_up_med_omit_poly(4)), ")x^2 + (", num2str(D_up_med_omit_poly(5)), ")x + ", num2str(D_up_med_omit_poly(6)));
legend("Raw Cal Data", D_up_omit_polystr);

% Collector D Downsweep (0.2 nA omission)
figure(10);
n_D_dn_omit = 4;
D_dn_med_omit_poly = polyfit(D_med_dn_omit, input_currents_omit200pA, n_D_dn_omit);
syms iDdO;
fiDdO = 0;
for i = 1:n_D_dn_omit+1
    fiDdO = fiDdO + D_dn_med_omit_poly(i)*iDdO^(n_D_dn_omit-(i-1));
end
fplot(fiDdO, 'LineWidth', 2);
D_dn_omit_polystr = strcat("(", num2str(D_dn_med_omit_poly(1)), ")x^4 + (", num2str(D_dn_med_omit_poly(2)), ")x^3 + (", num2str(D_dn_med_omit_poly(3)), ")x^2 + (", num2str(D_dn_med_omit_poly(4)), ")x + ", num2str(D_dn_med_omit_poly(5)));
legend("Raw Cal Data", D_dn_omit_polystr);

%% Calculate error between polynomial fit and data (benchmark: MSE < 1E-3)

% Collector A Upsweep
A_up_med_vals = polyval(A_up_med_poly, A_med_up);
mse_A_up = immse(input_currents_nA, A_up_med_vals);
disp("MSE - A Upsweep: ");
disp(mse_A_up);

% Collector A Downsweep
A_dn_med_vals = polyval(A_dn_med_poly, A_med_dn);
mse_A_dn = immse(input_currents_nA, A_dn_med_vals);
disp("MSE - A Downsweep: ");
disp(mse_A_dn);

% Collector B Upsweep
B_up_med_vals = polyval(B_up_med_poly, B_med_up);
mse_B_up = immse(input_currents_nA, B_up_med_vals);
disp("MSE - B Upsweep: ");
disp(mse_B_up);

% Collector B Downsweep
B_dn_med_vals = polyval(B_dn_med_poly, B_med_dn);
mse_B_dn = immse(input_currents_nA, B_dn_med_vals);
disp("MSE - B Downsweep: ");
disp(mse_B_dn);

% Collector C Upsweep
C_up_med_vals = polyval(C_up_med_poly, C_med_up);
mse_C_up = immse(input_currents_nA, C_up_med_vals);
disp("MSE - C Upsweep: ");
disp(mse_C_up);

% Collector C Downsweep
C_dn_med_vals = polyval(C_dn_med_poly, C_med_dn);
mse_C_dn = immse(input_currents_nA, C_dn_med_vals);
disp("MSE - C Downsweep: ");
disp(mse_C_dn);

% Collector D Upsweep (0.2 nA omission)
D_up_med_omit_vals = polyval(D_up_med_omit_poly, D_med_up_omit);
mse_C_up_omit = immse(input_currents_omit200pA, D_up_med_omit_vals);
disp("MSE - D Upsweep (0.2 nA omission): ");
disp(mse_C_up_omit);

% Collector D Downsweep
D_dn_med_vals = polyval(D_dn_med_poly, D_med_dn);
mse_D_dn = immse(input_currents_nA, D_dn_med_vals);
disp("MSE - D Downsweep: ");
disp(mse_D_dn);