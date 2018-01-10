function [D] = gderivative (A, community, node_id, selected_neighbours, precision, func_id, my_func_args)
%
% D: the derivative vector
%

% Inputs:
%   A: adjacency matirx

%   node_id: index of the node in which we want to find the derivatives

%   selected_neighbours: are the neighbours in which we calculate the
            %derivative based on them.. They are included in the approximation

%   derivative_upper_bound: if it's 3 then the 3rd derivative is the
            %highest derivative we're interested in calculating. This value
            %can't be higher than selected_neighbour (look at publication)


%   precision: the derivative precision 

%   func_id: function id denotes the function we want to find the
%   derivative of

%   args: depending on func different arguments are needed, they're kept
            %in args

% Explanation:
%
%
% Requirements:
%
%
% Version: 1
% Date: Wed. 6 April 2016 18:14 AEST
% Author: Amin Rigi
% Email: amin.rigi@gmail.com


   

    if func_id == 1 
        f_handle = @MyFunc; % Look at implementation
    end
    
    if func_id == 2
       f_handle = @dist_tension; 
    end
    
    
    lst = find(A(node_id,:));
    lst = intersect( lst, community);
    

    
    if (length(lst)==1) %Means node_id only has one neighbour
        singleton_id =  lst;
        lst = find(A(singleton_id,:));
        selected_neighbours = intersect(lst, community);
        distances_mat = distance_matrix_singleton(A, precision, node_id, singleton_id, selected_neighbours);
       
    else %if node has more than one node
        distances_mat = distance_matrix(A, precision, node_id, selected_neighbours);        
    end
    
    % distances_mat's dimension = length(selected_neighbours) X precision
    
    len = length(selected_neighbours);
    %len = length(distances_mat);
    C = zeros(len,1);
    
    tmp = f_handle (A, node_id, my_func_args);
    for i=1:len
        C(i) = f_handle(A, selected_neighbours(i), my_func_args) - tmp; 
    end
        
%     [Q, R] = qr(distances_mat);
%     D1 = transpose(Q)\R * C;
    
    %D = distances_mat \ C;

    D = distances_mat * pinv(distances_mat)*C;
    
    if D==0
        D = zeros(1,2);
    end
    
    if isempty(D)
        D = zeros(1,2);
    end
    
end