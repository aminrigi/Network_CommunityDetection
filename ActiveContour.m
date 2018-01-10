function [ community ] = ActiveContour( A, seed)
%Output:
%   Community is a list of the nodes in the community ordered by there
%   inclusion

%Inputs:
%   A: Adjucency Matrix
%   seed: Initual seed. This is a seed-based community detection



% Version: 1
% Date: Mon. 11 April 2016 13:14 AEST
% Author: Amin Rigi
% Email: amin.rigi@gmail.com


[len,~] = length(A);

nodes_id = 1:len; %it is assumed nodes are named from 1 to len
% grad_magnitude_init(1:len) = -1;  %for initialising the map
% 
% grad_mag_matix = zeros(len,len);
% grad_mag_matix(1:len,1:len) = -1;

%at the beginning grad for all nodes is assumed to be -1. Whenever we need
%the grad of a certain node we will updates its value in this map

    



end

