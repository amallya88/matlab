function output=digit_sum(input)
if input < 10
    output = input;
else
    output = rem(input, 10) + digit_sum(fix(input/10));
end  