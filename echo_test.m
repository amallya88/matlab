% Load splat which adds y and Fs to the workspace
load splat

Fs = 8192;
delay = 0.05;
amp = 0.6;

% Call echo_gen to create the new audio data
output = echo_gen(y, Fs, delay, amp);

% The time between points is 1/Fs;
dt = 1/Fs;
% Plot the original sound
plot(0:dt:dt*(length(y)-1), y)
% Plot the new data to see visualize the echo
figure
plot(0:dt:dt*(length(output)-1), output)

sound (output, Fs)