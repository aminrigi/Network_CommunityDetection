function [ tension, edgeList, edgeOutside ] = surface_tension( A, community, precision )

    [ edgeList, edgeInside, edgeOutside] = getBoundry(A, community);
    kappa = 0;
    edgeLength = length(edgeList);
    
    func_id = 1;
    
    
    for i=1:edgeLength
        outNeighbours = edgeOutside.(sprintf('a%d',edgeList(i)));
        
       if ~isempty(outNeighbours) %has a neighbour
          
           derivatives = gderivative(A, community, edgeList(i), edgeInside.(sprintf('a%d',edgeList(i))), precision, func_id, edgeOutside.(sprintf('a%d',edgeList(i))) );
           kappa = kappa + abs(derivatives(2) ) / (  1 + derivatives(1).^2   ).^1.5;
           
       end
        
        
    end
    
    
    [inner_p, outter_p] = pressure(A,edgeList, edgeInside, edgeOutside);
    
    tension = -1 * (inner_p - outter_p) /(1+ kappa);

end

