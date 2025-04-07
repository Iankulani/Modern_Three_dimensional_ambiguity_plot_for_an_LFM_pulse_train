% Clear previous variables and close any open figures
clear all; close all;

% Prompt user to enter the required parameters
taup = input('Enter the pulse width (tau_p) in seconds:');
pri = input('Enter the pulse repetition interval (PRI) in seconds:');
n = input('Enter the number of pulses (N):');
bw = input('Enter the bandwidth (B) in Hz:');

% Generate the ambiguity function for LFM pulse train
x = train_ambg_lfm(taup, n, pri, bw);

% Create the first 3D plot
figure(1)
time = linspace(-(n-1)*pri-taup, n*pri-taup, size(x,2));
doppler = linspace(-bw, bw, size(x,1));

% 3D surface plot
surf(time, doppler, x); 
shading interp;
xlabel('Delay in seconds');
ylabel('Doppler in Hz');
zlabel('Ambiguity function');
axis tight;
title(['LFM pulse train, B\tau = ', num2str(bw*taup), ', N = ', num2str(n), ' pulses']);

% Create the second contour plot
figure(2)
contour(time, doppler, x);
xlabel('Delay in seconds');
ylabel('Doppler in Hz');
grid;
axis tight;
title(['LFM pulse train, B\tau = ', num2str(bw*taup), ', N = ', num2str(n), ' pulses']);
