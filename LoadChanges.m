function [ Added_Nodes, added_nodes_clusters, added_Edges, counter, deletedEdges, operation_id] = LoadChanges( inputArg)

%Input: file directory of change.txt

%Added_Nodes : list of added nodes the next argument is their cluster
%added_edges : list of added edges
%number of added edges for each time step

    operation_id=[];
    Added_Nodes = [];
    added_nodes_clusters =[];
    edge_1=[];
    edge_2=[];
    deletedEdges =[];
    counter = [];%number of added edges for each newly added node
    tmp_count=0;
    
    fid = fopen(inputArg);
    code = fscanf(fid, '%d',1);%of course code will be -10 here
    code = fscanf(fid, '%d',1);
    
    while ~feof(fid)
        
        
        switch (code)
            case -1
                tmp = fscanf(fid, '%d %d',2);
                Added_Nodes = [Added_Nodes tmp(1)];
                added_nodes_clusters = [added_nodes_clusters tmp(2)];
                if ~(tmp_count==0) 
                    counter = [counter tmp_count];
                end
                tmp_count = 0;
                operation_id=[operation_id -1];
                
            case -2
                tmp = fscanf(fid, '%d %d',2);
                edge_1 = [edge_1 tmp(1)];
                edge_2 = [edge_2 tmp(2)];
                tmp_count = tmp_count+1;
                operation_id = [operation_id -2];
            case -3
                tmp = fscanf(fid, '%d %d',2);
                deletedEdges = [deletedEdges tmp];
                operation_id = [operation_id -3];
            
                
                
                
            
            
            
        end
        
        code = fscanf(fid, '%d',1);
        
    end
    counter = [counter tmp_count];
    
    added_Edges = zeros(2, length(edge_1));
    added_Edges (1,:) = edge_1;
    added_Edges (2,:) = edge_2;

    added_Edges = transpose(added_Edges);
end

