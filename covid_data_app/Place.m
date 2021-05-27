classdef Place < handle
    % Class to hold covid case and deaths data for a place
    % place is a geographic location with the interface defined below
    properties
        Name (1,1) string
        Data containers.Map
        Within handle = []
        Contains cell = {}
    end

    methods
        function obj = Place(name, data, p, c)
            % p - parent / container obj
            % c - children / contained objects. 
            % p and c are handles to other Places
            % data is a map object, of datetime str and 1x2 row vector
            arguments
                name
                data  = containers.Map               
                p = []  % optional
                c = {}  % optional
            end
            obj.Name = name;
            obj.Data = data;
            obj.Within = p;
            obj.Contains = c;
        end
    end
end