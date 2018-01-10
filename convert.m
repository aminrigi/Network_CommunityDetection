% fileID_net = fopen('ucfca_net.txt','w');
% %fileID_nod = fopen('/home/amin/Desktop/Graph/ds/facebook100/cal_nod.txt','w');
% 
% loop = 2682;
% for i = 1:loop
%      %fprintf(fileID_nod,'%d\n',i);
%    for j=1:1:loop
%        if(A(i,j)==1)
%            fprintf(fileID_net,'%d\t%d\n',i,j);
%        end
%    end
% end
% 


fileID_net = fopen('ucfca_combo.net','w');
%fileID_nod = fopen('/home/amin/Desktop/Graph/ds/facebook100/cal_nod.txt','w');


loop = 2682;
fprintf(fileID_net, '*Vertices %d\n',loop);
for i = 1:loop
   fprintf(fileID_net,'%d \"%d\"\n',i, i);
end

fprintf(fileID_net, '*Arcs\n');
for i = 1:loop
   for j=1:1:loop
       if(A(i,j)==1)
           fprintf(fileID_net,'%d %d %d\n',i,j,1);
       end
   end
end
