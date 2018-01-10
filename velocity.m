function [ speed ] = velocity( A, community, source, dest, selected_neighbours, precision, alpha )

%Inputs:
%   A: adjucency matrix

%   source & dest: velocity is caluculated from source to dest.

%   selected_neighbours: derivative is calculated based on the selected
%   nighbours. They are inside neighbours, or subset of the inside
%   neighoboure

%   Precision: look at derivative.m

%   alpha: gradient parameter

%Output:
%   speed from node source to node dest



% Explanation:
%
%
% Requirements:
%
%
% Version: 1
% Date: Wed. 15 April 2016 16:33 AEST
% Author: Amin Rigi
% Email: amin.rigi@gmail.com



 
    [ kappa, grad, derivatives ] = curvature_and_grad(A, source, dest, selected_neighbours,precision, community);
    %grad_mag_vector(source,dest) = grad;
%     if(kappa <1) 
%         kappa = kappa * kappa;
%     end
    speed = kappa / (1+ alpha * grad.^2) - atan(abs(derivatives(1)));

end

