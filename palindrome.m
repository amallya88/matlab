function b = palindrome(p)
    if length(p) <= 1
        b = true;  % base case is char or empty input
    else
        b = (p(1) == p(end)) && palindrome(p(2:end-1));
        % p(2:end-1) will produce empty [] if length is 2
    end