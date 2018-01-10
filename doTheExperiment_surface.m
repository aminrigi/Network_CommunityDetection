function [precision, recall, F1 ] = doTheExperiment_surface(changeLog, net, nodes)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[ added_Nodes, added_nodes_clusters, added_Edges, counter, deletedEdges, operation_id ] = LoadChanges( changeLog);



false_positive = 0;
    false_negative = 0;
    true_positive = 0;
    true_negative = 0;

    size = 1000+length(added_Nodes);

    A = zeros(size);

    tmp = net;
    for i=1:length(tmp)
       A(tmp(i,1), tmp(i,2))  =1;
       A(tmp(i,2), tmp(i,1))  =1;

    end

    tmp_count = 1;
    
    addedEdge_counter=1;
    addedNode_counter=1;
    deletedEdge_counter = 1;
    deletedNode_counter = 0;
    newNodes=zeros(length(added_Nodes),2);
    dontCalc = [-1 -1 -1 -1 -1]; %for ommiting unnecessary repetations
    prevTension = [inf inf inf inf inf];
    afterTension = [inf inf inf inf inf];
    
    
    for i=1:length(operation_id)
       
        switch operation_id(i)
            
            
            case -1 %node_addition
                if (addedNode_counter > 1)
                    community_id = added_nodes_clusters(addedNode_counter-1);
                    community1 = nodes(nodes(:,2)==community_id,:);
                    tmp_comm1 = nodes(newNodes(:,2)==community_id,:);
                    community1 = union(transpose( community1(:,1)),transpose( tmp_comm1(:,1)));
                    
                    if dontCalc(community_id) == -1
                        [prevTension(community_id),  ~, ~] = surface_tension(A, community1, 2);
                    end
                    
                    [afterTension(community_id), ~, ~] = surface_tension(A, [community1 added_Nodes(addedNode_counter-1)], 2);
                    sw = -1;
                    if (afterTension(community_id) < prevTension(community_id))
                        sw = 1;
                        prevTension(community_id) = afterTension(community_id);
                        dontCalc(community_id) = 1;
                    end
                    
                    newNodes(addedNode_counter-1,1) = added_Nodes(addedNode_counter-1);
                    switch sw
                        case 1
                            community1 = [community1 added_Nodes(addedNode_counter-1)];
                            if community_id == added_nodes_clusters(addedNode_counter-1)
                               true_positive = true_positive+1;
                               
                               
                            else
                                false_positive = false_positive+1;
                                
                            end
                            
                            newNodes(addedNode_counter-1,2) =  community_id;% community is assigned to that node

                        case -1
                            if community_id == added_nodes_clusters(addedNode_counter-1)
                                false_negative = false_negative+1;

                            else
                                true_negative = true_negative + 1;
                            end
                            newNodes(addedNode_counter-1,2) =  0; % xero means that they don't belong to any community apparently
                    end
                    
                                       
                end
                addedNode_counter = addedNode_counter + 1;
            
            
            
            case -2 %edge addition
                A(added_Edges(addedEdge_counter,1), added_Edges(addedEdge_counter,2))  =1;
                A(added_Edges(addedEdge_counter,2), added_Edges(addedEdge_counter,1))  =1;
                addedEdge_counter = addedEdge_counter +1;
                
            
            case -3 %edgeDeletion
                A(deletedEdges(deletedEdge_counter)   , deletedEdges(deletedEdge_counter+1)) = 0;
                A(deletedEdges(deletedEdge_counter+1) , deletedEdges(deletedEdge_counter))   = 0;
                deletedEdge_counter = deletedEdge_counter + 2;
                
        end
        
    end


    precision = true_positive/(true_positive+false_positive)

    recall = true_positive/(true_positive+false_negative)

    F1 = 2*(precision*recall)/(precision+recall)
    
    true_positive+ false_positive+false_negative+true_negative
    


end

