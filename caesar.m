%% Caesar shift - basic cryptographic encoding function
function coded = caesar(msg, shift)
    coded = int16(msg) + shift;
    first = int16(' ');
    last = int16('~');
    % normalize ascii value of each element using value of first visible char (32)
    % normalized ascii values for visible chars range from 0 to 94 instead of 32 to 126
    % last - first + 1 : total number of characters
    % modulo provides final index of element after it has been wrapped 
    % add back first to get correct character values
    coded = char(mod(coded - first, last - first + 1) + first);
end