function [ A, change_list, add_list, del_list ] = changeMatrix( A, probEdge, numberOfAddedNodes, probNewNodeEdge, probDel )
%

%inputs:
%   A: adjucency matrix
%   probEdge: the probablity of adding/removing an edge
%   numberOfAdd.. : new nodes added to community
%   probNewNode.. : probablity of crating new nodes between newly added
%   nodes and the community.

% list: list of changed nodes

    change_list = [];


    len = length(A);

    for i=1:len
        for j=1:len
            if(rand < probEdge)
                change_list = union(change_list, i);
               if A(i,j) == 1
                   A(i,j) = 0;
                   A(j,i) = 0;
               else
                   A(i,j) = 1;
                   A(j,i) = 1;
               end
            end
        end
    end


    add_list = [];
    
    %Adding a new Node
%     for i=1:numberOfAddedNodes
%         add_list = union(add_list, len+1);
%         for j=1:len
%             if(rand < probNewNodeEdge)
%                 A(len+1,j)  = 1;
%                 A(j, len+1) = 1;
%             else
%                 A(len+1,j)  = 0;
%                 A(j, len+1) = 0;
%             end
% 
%         end
%         len = len+1;
%     end
% 
    del_list = [];
%     len = length(A);
%     for i=1:len
%         if(rand < probDel)
%             del_list = union(del_list, i);
%            
%             A(i,:) = 0;
%             A(:,i)=  0;
%         end
%     end
    
    
    
    

end

