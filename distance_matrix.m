function [taylor_distance] = distance_matrix(A, precision, node_id, selected_neighbours)
%
% taylor_distance: it's a matrix. First col is distnce from selected
% neighbours, next cols are based on taylor series. For example, the
% following is taylor_distance matrix function for 3 selected_neighbours
% for node_id when precision is 3
%
%  d1   d1^2/2!  d1^3/3!
%  d2   d2^2/2!  d2^3/3!
%  d3   d3^2/2!  d3^3/3!
%
%  d1 = diantance (node_id, selected_neighbour(1));

% Inputs:
%   A: adjancency matrix
%   precision: the precision of the derivative a.k.a the number of cols in
%   the taylor_distance func
%   selected_neighbours: a vector of neighbours which we are interested to
%       compute distances from node_id to them
%   node_id: 

% Version: 1
% Date: Thurs. 24 March 2016 15:34 AEST
% Author: Amin Rigi
% Email: amin.rigi@gmail.com


    len = length(selected_neighbours);
    taylor_distance = zeros(len, precision);

    for i=1:len
        taylor_distance (i , 1) = gdistance (A, node_id, selected_neighbours(i));
        for j=2:precision
           taylor_distance(i, j) = (taylor_distance(i,1).^j) / factorial(j);
        end
    end

end