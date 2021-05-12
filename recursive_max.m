function mx = recursive_max(v)
l = length(v);
if l == 1
    mx = v(1);
else
    mx_tl = recursive_max(v(2:l));
    if v(1) > mx_tl
        mx = v(1);
    else
        mx = mx_tl;
    end
end
