function reversed = reversal(v)
l = length(v);
if l == 1
    reversed = v;
else
    reversed = [v(l) reversal(v(1:l-1))];
end
