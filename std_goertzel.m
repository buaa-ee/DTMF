function [P] = std_goertzel(X)
N = 205; Fs = 8e3;
freqs   = [697  770  852  941 1209 1336 1477 1633];
indices = round(freqs/Fs*N); % [18 20 22 24 31 34 38 42]

X = hann(N)' .* X(1:N);
P = calchelper(X,indices); % X should have N(=205) pts
end

function p = calchelper(X,K)
N = 205;

% see: http://www.cnblogs.com/haibin-zhang/p/5515607.html
C = 2*cos(2*pi*K/N);
V1 = zeros(1,length(K));
V2 = zeros(1,length(K));
for n = 1:length(X) % should be 205
    V0 = C.*V1 - V2 + X(n);
    V2 = V1;
    V1 = V0;
end

p = V1.^2 + V2.^2 - C.*V1.*V2;
end