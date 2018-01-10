function [ newComm ] = Track( A, community, mod_list, add_list, del_List, precision, alpha, threshold )

%Inputs:
%   A: adjucency matrix

%   community: the community
%   mod_list: Nodes that have had change
%   add_list: newly added nodes
%   del_list: deleted nodes

%   Precision: look at derivative.m

%   alpha: gradient parameter

%Output:
%   newCommunity



% Explanation:
%
%
% Requirements:
%
%
% Version: 1
% Date: Mon. 16 May 2016 22:21 AEST
% Author: Amin Rigi
% Email: amin.rigi@gmail.com

    %[ edgeList, edgeInside, edgeOudsite ] = getBoundry(A, community);
    
    
    %%% First modification list
    mod1 = intersect(community, mod_list); % what has been modified in the community
    
    community = setdiff(community, mod1);
    
    [ edgeList, edgeInside, edgeOudsite ] = getBoundry(A, community);

    mod2 = intersect(mod_list, edgeOudsite);
    
    mod = union(mod1, mod2);
    
    
    candidates = [];
    commInside = [];
    for i=1:length(community)
       for j=1:length(mod)
          if A(community(i), mod(j)) == 1  %wether there is an edge between them
              candidates = union(candidates, community(i));
              commInside = union(commInside, mod(j));
          end
       end
    end

    
    newComm=[];
    
    for i=1:length(commInside)
       for j=1:length(candidates)
          if (A(commInside(i), candidates(j))) == 1
              speed = velocity(A, community, commInside(i), candidates(j), edgeInside.(sprintf('a%d',commInside(i))), precision, alpha);
              if speed>threshold
                  newComm = union(newComm, candidates(j));
              end
          end
       end
    end
    
    



end

