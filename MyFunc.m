function [ ret_val ] = MyFunc(A, node_id, args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


    ret_val = 1;

    %First option for my func: returns the distance between the two nodes. args
    %represents the second node. here args has only one element

    src = find( A(node_id, :) ) ;
    dst = find( A(args,  :) );
    
%     tmp = intersect(src, dst);
%     tmp2 = union(src, dst);
%     tmp3 = setdiff(tmp2, [node_id args]);
    
    ret_val = 1 - (length(intersect(src ,dst)) / length( setdiff( union(src,dst),  [node_id args] ) )) ;

    
    
    %For other purposes (e.g. other problems) different implementations can
    %be added here and the code segment above must be segmented out.
    
    
end

