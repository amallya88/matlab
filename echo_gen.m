%% add an echo to a given sound input
function output=echo_gen(input, fs, delay, amp)
    % input - column vector representing a sound file
    % fs - sampling rate of sound samples/second
    % delay - delay of echo in seconds. echo starts after delay seconds have passed from START of sound
    % amp - echo amplification (or attenuation)
    
    % original input plus padding for echo
    s1 = [input; zeros(round(delay*fs), 1)]; 
    % padding for delay plus input scaled by amp (echo)
    s2 = [zeros(round(delay*fs), 1); input .* amp];
    
    % echo is scaled input signal
    % output is addition of input with the echo, phase shifted by delay
    output = s1 + s2; % composite signal
    
    % the abs of all values must be < 1. Rescale if necessary
    if max(abs(output)) > 1
        output = output./max(abs(output));
    end