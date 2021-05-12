function db = voters(db, varargin)
n = length(varargin);
db = db;  % 1 by N struct array
% struct has fields 'Name', 'ID'
    % odd number of args or no args, return
    if rem(n, 2) || n == 0
        return
    else
        new_db = db;
    	for i = 1:2:n
    		if ~isa(varargin{i}, 'char') && ~isa(varargin{i}, 'string')
                % if name field is illegal, return 
                return
            end
            if ~isa(varargin{i+1}, 'numeric') || rem(varargin{i+1}, 1)
                % ID field illegal
                return
            end
            v.Name = string(varargin{i});
            v.ID = varargin{i+1};
            new_db = [new_db v];
        end
        db = new_db;
    end