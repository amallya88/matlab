function db = name_value_pairs(varargin)
n = nargin;
if rem(n, 2) || n == 0
	db = {};
    return
else
	for i = 1:fix(n/2)
		if ~isa(varargin{2*i-1}, 'char')
			db = {};
            return
        end
        db{i,1} = varargin{2*i-1};
        db{i,2} = varargin{2*i};
	end
end
    