function result=grader(f1, f2, varargin)
% f1 and f2 are function handles
% run f1 and f2 using all arguments in cell array varargin
% return result of comparison of all outputs of f1 and f2

    function resA = arr_func(f, cellA) 
        % this function implements arrayfun for cell arrays
        resA = [];
        for i = 1:length(cellA)
            resA = [resA f(cellA{i})];
        end
    end
    result = isequal(arr_func(f1, varargin), arr_func(f2, varargin));
end
