function [ edgeList, edgeInside, edgeOudsite ] = getBoundry( A, community )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


    % no_node_on_edge = length(community);
    edgeList = [];
    for i = 1:length(community)
        current_node = community(i);
        current_node_nhbrs = find(A(current_node,:));
        C = intersect(current_node_nhbrs,community);
    %     pause
        if(~isequal(current_node_nhbrs,C))
            edgeList = [edgeList, current_node];
            edgeOut = setdiff(current_node_nhbrs,community);
            edgeOudsite.(sprintf('a%d',current_node)) = edgeOut;
            edgeInside.(sprintf('a%d',current_node)) = setdiff(current_node_nhbrs, edgeOut);
        end
    end

end

