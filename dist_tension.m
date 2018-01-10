function [ ret_val ] = dist_tension(A, node_id, args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


    %distance for tenstion: will be average structural similarity to
    %outside neighbours.

    ret_val = 0;

    %First option for my func: returns the distance between the two nodes. args
    %represents the second node. here args has only one element

    
    
    len = length(args);
    
    src = find( A(node_id, :) ) ;
    
    
    for i=1:len
        dst = find( A(args(i),  :) );
        tmp = 1 - (length(intersect(src ,dst)) / length( setdiff( union(src,dst),  [node_id args(i)] ) )) ;
        ret_val = ret_val +tmp;
        
    end
    
    
    
    
    
    
    
%     tmp = intersect(src, dst);
%     tmp2 = union(src, dst);
%     tmp3 = setdiff(tmp2, [node_id args]);
    
    

    ret_val = ret_val / len;

    
    
    %For other purposes (e.g. other problems) different implementations can
    %be added here and the code segment above must be segmented out.
    
    
end

