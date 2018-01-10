function [ new_comm ] = evolve_surface_tension( A, community )

    tmp_community = community;
    [ tension, edge, edgeOutside ] = surface_tension( A, community, 2 );
    
    
    edgeLength = length(edge);

    for i=1:edgeLength
        outNeighbours = edgeOutside.(sprintf('a%d',edge(i)));
        
        for j=1:length(outNeighbours)
            
            tmp_community = [tmp_community outNeighbours(j) ];
            
            [ tmp_tension, tmp_edge, tmp_edgeOutside ] = surface_tension( A, tmp_community, 2 );
            
            if(tmp_tension < tension)
               edgeOutside = tmp_edgeOutside;
               edge = tmp_edge;
               new_comm = tmp_community;
               tension = tmp_tension;
               
               break;         
                
                
            end
            
            
        end
        
        
    end

end

