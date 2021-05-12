%% Check if a given date (y,m,d) is a valid date
function valid = valid_date(year, month, day)
valid = false;

% all 3 args required
if ~(nargin == 3)
    return
end

% scalar check
if ~(isscalar(year) && isscalar(month) && isscalar(day))
    return
end

% check args positive
if ~all([year month day] > 0)
    return
end

% check args are ints
if any(rem([year month day], 1))
    return
end

if month > 12 || day > 31
    return
end

% 31 day months: 1,3,5,7,8,10,12
% 30 day months: 4,6,9,11
% feb: 28 days except for leap years which have 29 days
days_in_months = [31 28 31 30 31 30 31 31 30 31 30 31];
if ((mod(year, 4) == 0 && mod(year, 100) > 0) || mod(year, 400) == 0)
    days_in_months(2) = 29;
end

valid = day <= days_in_months(month);