function key = extract2(series)
key = '';
series = ['----' series];
w_enable = 1;
for i = 1:length(series)-3
    K = series(i:i+3);
    
    if all(K(2:4) ~= K(1))
        w_enable = 1;
    end
    
    if  w_enable == 1           ...
      && isequal(K(4),K(3),K(2),K(1))...
      && K(4) ~= '-'            ...
        key(length(key)+1) = K(4);
        w_enable = 0;
    end
end

end