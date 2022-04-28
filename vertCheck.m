function [win] = vertCheck(cF, currentPlayer, col, row)

win = 0;
count = 1;
connected = true;
tempRow = row;
row = row - 1;

%Going Up
while( (row >= 1) && (connected) )
    if(cF(row, col) == currentPlayer)
        count = count + 1;
    else
        connected = false;
    end
    row = row - 1;
end



if(count < 4)
    row = tempRow + 1;
    connected = true;
    %Going Right
    while( (row <= 6) && (connected) )
        if(cF(row, col) == currentPlayer)
            count = count + 1;
        else
            connected = false;
        end
        row = row + 1;
    end 
end

if(count >= 4)
   win = currentPlayer; 
end

end