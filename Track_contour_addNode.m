function [ newCommunity, sw ] = Track_contour_addNode(Q, community, addItem, precision, alpha, threshold)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    sw = -1; % sw will be one if the belongs to the community


    newCommunity = community;


    %First step is to check wether the addItem is on the boundary

    %for the records: I'm being a lazy ass here!
    [ edgeList, edgeInside, edgeOutside ] = getBoundry( Q, community );

    index = -1;
   
    for i=1:length(edgeOutside)
       tmp =  edgeOutside.(sprintf('a%d',edgeList(i)));
       if(~isempty(find(tmp == addItem)))
          index = 1; 
           break;
       end
    end
    
    
    

    if(index == -1) %if it's not on the boundary, no change is applied
        sw = -3;
       return; 
    end


    % 2nd step: to find the inner neighbours of the addItem

    addItem_neighbours = find(Q(addItem,:));
    addItem_inner_neighours  = []; % here we have the nieghbours which are inside the community
    for i=1:length(addItem_neighbours)
       if (~isempty(      find(community == addItem_neighbours(i))  ) )
           addItem_inner_neighours = [addItem_inner_neighours community( find(community == addItem_neighbours(i)) )];
       end
    end
    
    

    %Now it's time to check for inclusion
    sw = -1;
    for i=1:length(addItem_inner_neighours)
       vel = velocity(Q, community, addItem_inner_neighours(i), addItem, edgeInside.(sprintf('a%d',  addItem_inner_neighours(i)  )), precision, alpha  );
       
       if (vel > threshold )
           newCommunity = [newCommunity addItem];
           sw = 1;
           break;       
       end

    end
    
    
    
    %if the item is added we check for its locality
    if (sw == 1) % the item is added
        
    end
    
    


end

