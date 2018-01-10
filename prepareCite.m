function [newCommunity] = Tack_contour(A, community, addList, delList, precision, alpha, threshold)


    newCommunity = community;
    for i=1:length(addList)
      newCommunity = Track_contour_addNode(A, community, addList(i), precision, alpha, threshold);
    end


    for i=1:length(delList)
      newCommunity = Track_contour_delNode(A, community, delList(i), precision, alpha, threshold);
    end


end