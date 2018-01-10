function [newCommunity] = Track_contour_deleteNode(A, community, delItem, precision, alpha, threshold)

%inputs:
%   


    %First step is to find the inner neighbuors of delItem
    delItem_neighbouts =  find (A(delItem,:) );
    delItem_inner_neighbours = [];
    
    for i=1:length(delItem_neighbouts)
       if (~isempty(      find(community == delItem_neighbouts(i))  ) )
           delItem_inner_neighbours = [delItem_inner_neighbours community( find(community == delItem_neighbouts(i)) )];
       end
    end

    
    
    % APPROACH ONE
    
    %Every neighbour of the delete Item is removed from the community. Then
    %velocity from their neighbour to them is calculated.
    newCommunity = setdiff(community, delItem);
    newCommunity = setdiff(newCommunity, delItem_inner_neighbours);
    
    
    for j=1:length(delItem_inner_neighbours)
        
        [ edgeList, edgeInside, ~ ] = getBoundry( A, newCommunity ); %Being a lazy ass! 
        
        from_neighbours = find(A(delItem_inner_neighbours(j), :) );
        from_them_to = [];
        for i=1:length(from_neighbours)
           if (~isempty(      find(community == from_neighbours(i))  ) )
               from_them_to = [from_them_to community( find(community == from_neighbours(i)) )];
           end
        end   
        
        for i=1:length(from_them_to)
            if (  velocity(A, newCommunity, from_them_to(i), delItem_inner_neighbours(j), edgeInside.(sprintf('a%d',edgeList(  addItem_inner_neighours(i)  ))), precision, alpha  ) > threshold )
                newCommunity = [newCommunity delItem_inner_neighbours(j)];
                break;
            end
        end
        
        
        
        
    end
    
    

end