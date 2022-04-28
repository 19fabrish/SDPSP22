function [row, col] = dropChip(cF,myScene, currentPlayer)
%dropChip: Pass in SGE Scence and Matrix, with the column you want.
%   Detailed explanation goes here
valid = 0;
[row, col] = getMouseInput(myScene);


while(~valid)
    row = 6;
    
    %Looking for available row
    while( (row >= 1) && (cF(row, col) ~= 1) )
        row = row - 1;
    end

    %If we went through all the rows
    if(row < 1)
        fprintf('Sorry, %s! Column is full. Try Again!\n', currentPlayer);
        [row, col] = getMouseInput(myScene);
    else
        valid = 1;
    end
end

end

