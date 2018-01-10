function [X, A] = ApplyAllChanges(net, changeLog)
%X is the matrix before changes
%A is the adjucency matrix after the relvant changes.
[ added_Nodes, added_nodes_clusters, added_Edges, counter, deletedEdges, operation_id ] = LoadChanges( changeLog);

 size = 1000+length(added_Nodes);
 
     A = zeros(size);
     X = zeros(1000);
    tmp = net;
    for i=1:length(tmp)
       A(tmp(i,1), tmp(i,2))  =1;
       A(tmp(i,2), tmp(i,1))  =1;
       
       X(tmp(i,1), tmp(i,2))  =1;
       X(tmp(i,2), tmp(i,1))  =1;

    end
    
    
    

for addedEdge_counter=1:length(added_Edges)
    A(added_Edges(addedEdge_counter,1), added_Edges(addedEdge_counter,2))  =1;
    A(added_Edges(addedEdge_counter,2), added_Edges(addedEdge_counter,1))  =1;
end


for deletedEdge_counter=1:length(deletedEdges)
   A(deletedEdges(deletedEdge_counter)   , deletedEdges(deletedEdge_counter+1)) = 0;
   A(deletedEdges(deletedEdge_counter+1) , deletedEdges(deletedEdge_counter))   = 0; 
end

