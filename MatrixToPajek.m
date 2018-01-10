function [] = MatrixToPajek(  A, dir )

    %Inputs:
    % A: an adjucency matrix

    % node label for community will be one for nonCommunity will be Zero
    graphSize = length(A);

  
    fID = fopen(dir,'w');
    
    fprintf(fID, '*Vertices %d\n',graphSize);
    
    for i=1:graphSize
       fprintf(fID, '%d \"%d\"\n',i, i); 
    end
    fprintf(fID, '*Arcs\n');
    for i=1:graphSize
       for j=1:graphSize
           if(A(i,j) == 1)
              fprintf(fID, '%d %d %f\n', i, j, 1); 
           end
       end
    end


end

