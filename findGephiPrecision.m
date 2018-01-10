function [ meanF1, f1Score, precision, recall ] = findGephiPrecision( gephiOutput, changeLog )

%This function calculates precision, recall, and F1 measure for gephi
%modulairty
   

    [ added_Nodes, added_nodes_clusters, ~, ~, ~, ~ ] = LoadChanges( changeLog);
    
    tmp = gephiOutput(1001:length(gephiOutput), 2);
    
    tmp = tmp+1;
    
    tmp = transpose (tmp);
    
    confusionMat = confusionmat(added_nodes_clusters, tmp)
    
    p = perms([1 2 3 4 5]);
    
    meanF1 = 0;
    meanF1_index = -1;
    tmpConfMat = zeros(5 ,5);
    
    for i=1:120 %length of p
        
        for j=1:5
            tmpConfMat(:, j) = confusionMat(:, p(i,j));
        end
        
        precision =  diag(tmpConfMat)./sum(tmpConfMat,2);
        
       
        
        recall =  diag(tmpConfMat)./sum(tmpConfMat,1)';

        f1Scores =  2*(precision.*recall)./(precision+recall);
        if (sum(isnan(f1Scores)) ~= 0 ) continue; end
        tmp_meanF1 =  mean(f1Scores);
        
        if(tmp_meanF1 > meanF1)
           meanF1 = tmp_meanF1;
           meanF1_index = i;
        end
        
        
        
        
    end
    
    
   meanF1
%     
%     precision =  diag(confusionMat)./sum(confusionMat,2)
% 
%     recall =  diag(confusionMat)./sum(confusionMat,1)'
% 
%     f1Scores =  2*(precision.*recall)./(precision+recall)
% 
%     meanF1 =  mean(f1Scores)
    
    
    
    

end

