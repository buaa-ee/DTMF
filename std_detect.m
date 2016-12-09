function key = std_detect(P)
th = 5e3;
keymap = [ '1' '2' '3' 'A'  ;
           '4' '5' '6' 'B'  ;
           '7' '8' '9' 'C'  ;
           '*' '0' '#' 'D' ];

A = [P(1:4)' P(5:8)'];
[M,I] = max(A);

% see https://en.wikipedia.org/w/index.php?title=Goertzel_algorithm&oldid=17802166
th = mean(P);
see_digit = any(M >= th*1.5) ...
          & M(1) > M(2) * 0.158 ...
          & M(2) > M(1) * 0.158 ...
          & sum(P > max(M) * 0.158 ) <= 2;

if (see_digit)
    key = keymap(I(1), I(2));
else
    key = '-';
end

end
