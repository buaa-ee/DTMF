function [Y, W, S] = std_dial(dialword, snr_gaussian, amp_50Hz)
Fs = 8e3;
n = length(dialword);

% generate dial sound
Y = [];
for k = 1:n
    key = dialword(k);
    t   = 250*rand() + 250; % 250 to 500 ms
    ts  = 500*rand() + 500; % 500 to 1000 ms
    X = dtmf(key, Fs, t, ts);
    Y = [Y X];
end

W = awgn(Y, snr_gaussian);

N = 1:length(W);
S = amp_50Hz * cos(2*pi* 50/Fs * N) + W;
end