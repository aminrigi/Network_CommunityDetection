function [ inner_p, outter_p ] = pressure( A, edge, edgeInside, edgeOutside )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    inner_p = 0;
    outter_p = 0;
    edgeLength = length(edge);
    
    for i=1:edgeLength
        
        outNeighbours = edgeOutside.(sprintf('a%d',edge(i)));
        if ~isempty(outNeighbours)
            for j=1:length(outNeighbours)
                outter_p = outter_p + gdistance(A, edge(i), outNeighbours(j));
            end
        end
        
        
        
        inNeighbours = edgeInside.(sprintf('a%d',edge(i)));
        if ~isempty(inNeighbours)
            for j=1:length(inNeighbours)
                inner_p = inner_p + gdistance(A, edge(i), inNeighbours(j));
            end
        end
        
        
    end
    
    inner_p = inner_p / edgeLength;
    outter_p = outter_p / edgeLength;
end

