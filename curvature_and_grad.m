function [ kappa, grad, derivatives ] = curvature_and_grad( A, source, dest, selected_neighbours, precision, community)

    %Inputs: look at velocity.m

    func_id = 1; % for curvature func_id = 1, which is structural similarity of source to dest.
                 %and dest (in addition to source) is the input argument of the func_id
                 
                 
                 
                 
                 
%SOME VCHANGES MUST BE DONE ON A
    derivatives = gderivative(A, community, source, selected_neighbours, precision, func_id, dest); % 

    
    kappa = abs(derivatives(2) ) / (  1 + derivatives(1).^2   ).^1.5;

    %if(grad_vec_matrix(source, dest) == -1)

        numOfNeighbr = length(selected_neighbours);

        if(numOfNeighbr==1) %singleton
           distMatrix = distance_matrix_singleton(A,precision,source,selected_neighbours(1), selected_neighbours);
        else
           distMatrix = distance_matrix(A, precision, source,selected_neighbours); 
        end

        F_c = MyFunc(A,source,dest);%we don't have additional arguments for args

        F_array = zeros(numOfNeighbr, 1);
        
        for i=1:numOfNeighbr
            F_array(i) = MyFunc(A,selected_neighbours(i),dest)-F_c;
        end

        F_array = F_array./distMatrix(:,1);

        grad = sumsqr(F_array).^.5;
    
%     else
%         grad = grad_vec_matrix(source, dest)
%     end
    
end

