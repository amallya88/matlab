function output = blur(img, w)
% convert to double for doing calculations
imgD = double(img);
[rows, cols] = size(img);
output = zeros(rows, cols);
for r = 1:rows
    for c = 1:cols
        r_start = r - w;
        if r_start < 1
            r_start = 1;
        end
        r_end = r + w;
        if r_end > rows
            r_end = rows;
        end
        c_start = c - w;
        if c_start < 1
            c_start = 1;
        end
        c_end = c + w;
        if c_end > cols
            c_end = cols;
        end
        section = imgD(r_start:r_end, c_start:c_end);
        output(r, c) = mean(section(:));
    end
end
% convert back to uint8
output = uint8(output);
        