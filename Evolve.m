function [ newCommunityList ] = Evolve( A, community, precision, alpha, threshold, edgeList, edgeInside, edgeOutside )

%Inputs: 
% A: extended adjucency matrix. 
% community: a vector containing members of a community.
% precision: precision of derivative. If it's 2 the order of approximated derivatives is 2. Look at the paper.
% alpha: gradient parameter. Look at the paper
% threshold: velocity of adding an element must be higher than threshold to be included. default value=0


%FOLLOWING PARAMETES CAN BE EXTRACTED FROM getBoundary.m
% edgeList: a vector contains the list of the nodes in the edge
% edgeInside: a struct which contains inside neighbours of the edge members 
% edgeOutside:a struct which contains outside neighbours of the edge members



%Outputs:
% newCommunityList: New community after evolving.

% Version: 1
% Date: Tuesday 3 May 2016 15:50 AEST
% Author: Amin Rigi
% Email: amin.rigi@gmail.com

    
    
    
    sw = 1;
    while(sw == 1)
        sw = 0;
        new_member = [];
        new_member_count=0;
        
        edgeLength = length(edgeList);
        for i=1:edgeLength
           outNeighbours = edgeOutside.(sprintf('a%d',edgeList(i)));
           if ~isempty(outNeighbours) %has a neighbour
               
               for j=1:length(outNeighbours)
                   if ( isempty(    find(new_member==outNeighbours(j))  ) && numel( edgeInside.(sprintf('a%d',edgeList(i)))) ~= 0 )
                       
                       speed = velocity(A, community, edgeList(i), outNeighbours(j), edgeInside.(sprintf('a%d',edgeList(i))), precision, alpha);
                       if speed > threshold
                           sw = 1; 
                           new_member_count = new_member_count + 1;
%                            new_member(new_member_count)=outNeighbours(j);
%                            speed44 = velocity(A, community, edgeList(i), outNeighbours(j), edgeInside.(sprintf('a%d',edgeList(i))), precision, alpha);

                       end
                   end
               end %iterating on a node on the edge


           end %end if has a neighbour


        end
        %community(length(community)+1:length(community)+1+new_member_count) = new_member;
        community = union(community, new_member);
        [ edgeList, edgeInside, edgeOutside] = getBoundry(A, community);
         
    end
    
    newCommunityList = community;
end

