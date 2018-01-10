coms = readFromFile('birthdeath.t01.comm', 557);



delList = zeros(40,4);
addList = zeros(40,4);

for i=1:4
    delList(:,i) = events1(40*(i-1)+1:40*(i-1)+40,  2);
    addList(:,i) = events1(40*(i-1)+40+1:40*(i-1)+80, 2);
end


M = zeros(length(addList(:,1)), length(Q(:,1)));
for j=1:4
    for i=1:length(addList(:,j))
        M (i,:) = Q(:,i); 
        Q(:,i) = 0;
        Q(i,:) = 0;
    end
end






for i=1:557
   x.(sprintf('a%d',i)) = Track_contour(M, Q, coms.(sprintf('a%d',i)), addList(:,1), [], 2, 2, .01);
end




%x = Track_contour(Q, coms.a1, addList(:,1), delList(:,1), 2, 2, .01);