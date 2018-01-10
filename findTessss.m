number_of_communities = 6;



% for i=0:(number_of_communities-1)
%     usfca_community{i+1} =  find(ucfsacombo(:)== i );
%     
% end



tensionss_USFCA = zeros (1, number_of_communities);

parfor i=1:number_of_communities
   
   tmpCom = usfca_community{i};
   
   tmpCom = transpose(tmpCom);
   
   [ tensionss_USFCA(i), ~, ~ ] = surface_tension( A, tmpCom, 2 );
    
       
    
end


% for i=1:number_of_communities
%     
%    dlmwrite(sprintf('usfca_%d',i), usfca_community{i}); 
% end