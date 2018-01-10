function [dist] =  gdistance (A, node1, node2)

% This function returns the distance between node1 and node2
% any desired distance function can be used. Here, we use 
% structural equivalence as distance measure.

% Inputs:
%   A: adjacency matrix

% Version: 1
% Date: Thurs. 24 March 2016 15:45 AEST
% Author: Amin Rigi
% Email: amin.rigi@gmail.com

    if A(node1,node2) == 0 
        dist = inf;
        return % if there is no connection between two nodes the distance is inf
    end


%     [length, ~] = size(A);
% 
%     counter_node1 = 0;
%     counter_node2 = 0;
%     counter_intersect = 0;
%     for i=1:length
%         if A(i, node1) ~= 0 
%           counter_node1 = counter_node1 + 1;
%         end
% 
%         if A(i, node2) ~= 0 
%           counter_node2 = counter_node2 + 1;
%         end
% 
%         if (A(i, node1) ~= 0 && A(i, node1) ~=0)
%           counter_intersect = counter_intersect + 1;
%         end
% 
%     end
    
    
    dist =1- (length(intersect(find(A(node1,:)==1), find(A(node2,:)==1))) / length(union(find(A(node1,:)==1), find(A(node2,:)==1))-2) );

%     dist = counter_intersect / (counter_node1+counter_node2-counter_intersect);

    dist  = dist .* A(node1, node2);  %in case if A is a wieighted matrix. It is 
                                     %assumed that weights are between 0 and 1
                                     %and when two nodes are connected it must
                                     %be higher than 0.

 

end
