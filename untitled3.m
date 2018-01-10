amin.a1 = 2;
amin.a2 = 5;
amin.a3 = 45;

for i=1:3
    amin.(sprintf('a%d',i)) = i;
end
