%% saddle point here defined as element whose value
% is greater than or equal to every element in its row
% and less than or equalto every element in its column
% return indices a 2 column matrix where each row
% contains addresses of the saddle points in M i.e. (row, col) index of
% saddle point in M
function indices = saddle(M)
indices = [];

if size(M, 2) > 1
    rmax = max(M,[],2);  % max of each row
else
    % if matrix is a col vector then max or each row
    % is the single element in the row itself
    rmax = M;
end

if size(M, 1) > 1
    cmin = min(M);  % min of each column
else
    % if matrix is a row vector then min of each column
    % is the single element in the column itself
    cmin = M;
end

for r = 1:size(M, 1)
    for c = 1:size(M, 2)
        if M(r, c) >= rmax(r) && M(r, c) <= cmin(c)
            indices = [ indices; [r c] ];
        end
    end
end

            
            