function keys = std_decode(Y)
ngrp = ceil(length(Y) / 205);
if length(Y) / 205 ~= ngrp
   Y(length(Y)+1:ngrp*205) = 0;
end
Z = reshape(Y,205,[])';

keys(1:ngrp) = '-';
for i = 1:ngrp
    P(i,:) = std_goertzel(Z(i,:));
    keys(i) = std_detect(P(i,:));
end
 
figure; hold on
for i = 1:4
    for j = 5:8
        plot( P(:,i) .* P(:,j) )
    end
end
legend('1','2','3','A','4','5','6','B','7','8','9','C','*','0','#','D')
end