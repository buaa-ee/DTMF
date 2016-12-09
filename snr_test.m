dialword = input('enter dial word:','s');
snr = input('enter awgn snr:');
amp = input('enter 50Hz amp:');

[Y, W, S] = std_dial(dialword, snr, amp);

extract2(std_decode2(S,16,6,0.2))