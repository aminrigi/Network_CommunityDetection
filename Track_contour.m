function [newCommunity] = Track_contour(M, Q, community, addList, delList, precision, alpha, threshold)
    
    %newCommunity = zeros(length(addList)+length(delList));
    newCommunity.(sprintf('a%d',1)) = community;
    
    
   for i=1:length(addList)
       Q(:,addList(i)) = M(i,:);
       Q(addList(i), :) = M(i, :);
      newCommunity.(sprintf('a%d',i+1)) = Track_contour_addNode( Q, newCommunity.(sprintf('a%d',i)), addList(i), precision, alpha, threshold);
   end


%    for i=length(addList)+1:(length(delList)+length(addList))
%       newCommunity.(sprintf('a%d',i+1)) = Track_contour_deleteNode(A, newCommunity.(sprintf('a%d',i)), delList(i-length(addList)), precision, alpha, threshold);
%    end


end