function [communities] = readFromFile(dir, size)
    %reads community of size 'size'
    
    fid = fopen(dir);
    for i=1:size
        strLine = fgetl(fid);
        numericLine = str2num(strLine);
        
        
        communities.(sprintf('a%d',i)) = numericLine;
    end

end