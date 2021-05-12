function clique = max_clique(graph)
clique = [];
    % check if individual with id followed follows our follower back
    % also check if all followers follow the followed id 
    function b = follows_back(graph, followed, follower)
        b = ~isempty(find(follower == graph{followed}));
    end

    % for each id i in graph, find a clique that includes i as a member    
    for i=1:length(graph)
        curr_clique = i;
        if ~isempty(find(i == clique))
            continue  % i is already in clique, skip
        end
        % for each f that i follows, check if f follows i back
        for f = 1:length(graph{i})
            if graph{i}(f) == i
                continue
            end
            % for each id f followed by i, check if f follows i back
            if follows_back(graph, graph{i}(f), i)     
                okAdd = 1;
                if length(curr_clique) > 1
                    % once there are 2 members in a clique
                    % need to check if all members that are not 'i' in
                    % curr_clique also follow 'f'
                    for j= 2:length(curr_clique)
                        okAdd = follows_back(graph, graph{i}(f), curr_clique(j));
                        if okAdd
                            okAdd = follows_back(graph, curr_clique(j), graph{i}(f));
                            if ~okAdd
                                break
                            end
                        else
                            break
                        end
                    end
                end
                if okAdd
                    curr_clique(end+1) = graph{i}(f);
                end
            end
        end
        if length(curr_clique) > length(clique)
            clique = curr_clique;
        end
    end
    clique = sort(clique)
end
