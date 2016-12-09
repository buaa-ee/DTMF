function [freq_low, freq_high] = dtmf_freq(key)
FL =  [697  770  852  941];
FH = [1209 1336 1477 1633];

% the lower frequency
switch key
    case {1 2 3 '1' '2' '3' 'A' 'a'}
        freq_low = FL(1);
    case {4 5 6 '4' '5' '6' 'B' 'b'}
        freq_low = FL(2);
    case {7 8 9 '7' '8' '9' 'C' 'c'}
        freq_low = FL(3);
    case {'*' 0 '0' '#' 'D' 'd'}
        freq_low = FL(4);
    otherwise
        warning('Unexpected input.')
        freq_low = nan;
end

% the higher frequency
switch key
    case {1 4 7 '1' '4' '7' '*'}
        freq_high = FH(1);
    case {2 5 8 0 '2' '5' '8' '0'}
        freq_high = FH(2);
    case {3 6 9 '3' '6' '9' '#'}
        freq_high = FH(3);
    case {'A' 'B' 'C' 'D' 'a' 'b' 'c' 'd'}
        freq_high = FH(4);
    otherwise
        warning('Unexpected input.')
        freq_high = nan;
end

end