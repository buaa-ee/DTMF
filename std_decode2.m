function keys = std_decode2(Y,hannw,th1,th2)
keymap = [ '1' '2' '3' 'A'  ;
           '4' '5' '6' 'B'  ;
           '7' '8' '9' 'C'  ;
           '*' '0' '#' 'D' ];
       
[kP,ngrp] = std_decode2_helper(Y,hannw);
keys(1:ngrp) = '-';
maxP = max(kP,[],3);

for i = 1:ngrp
    tmp = squeeze(kP(:,:,i));
    [a, row] = max(tmp);
    [b, col] = max(a);
    if b > mean(mean(tmp))*th1 && b > maxP(row(col),col)*th2
        keys(i) = keymap(row(col),col);
    end
end

end

function [kP,ngrp] = std_decode2_helper(Y,w)
ngrp = ceil(length(Y) / 205);
if length(Y) / 205 ~= ngrp
   Y(length(Y)+1:ngrp*205) = 0;
end
Z = reshape(Y,205,[])';

kP = zeros(4,4,ngrp);
P = zeros(ngrp,8);
for i = 1:ngrp
    P(i,:) = std_goertzel(Z(i,:));
end
 
figure; hold on
for i = 1:4
    for j = 5:8
        tmp = P(:,i)' .* P(:,j)';
        %b = 1/w*ones(1,w);
        b = hann(w);
        kP(i,j-4,1:ngrp+w-1) = conv(tmp, b);
        plot( squeeze( kP(i,j-4,:) ))
    end
end
ngrp = ngrp+w-1;
legend('1','2','3','A','4','5','6','B','7','8','9','C','*','0','#','D')
end