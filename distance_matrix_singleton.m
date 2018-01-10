function [ taylor_distance ] = distance_matrix_singleton( A, precision, node_id, singleton_id, selected_neighbours )
%
% taylor_distance: Look at disntance_matrix.m & [ publication url ]

%Explanation: this function creates the distance matrix when node_id only
              %has one neighbour which is called singleton_id, in this case
              %derivatives are approximated by using 






    len = length(selected_neighbours);
    taylor_distance = zeros(len, precision);
    m_dist = gdistance(A, node_id, singleton_id);

    for i=1:len
        taylor_distance (i , 1) = (m_dist + gdistance (A, singleton_id, selected_neighbours(i)));
        for j=2:precision
           taylor_distance(i, j) = (taylor_distance(i,1).^j) / factorial(j);
        end
    end






end

