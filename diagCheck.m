function [win] = diagCheck(cF, currentPlayer, row, col)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
tempRow = row;
tempCol = col;
connected = true;
win = 0;
count = 1;
row = tempRow - 1;
col = tempCol - 1;

%Going left and up
while( (row >= 1) && (col >= 1) && connected)
    if(cF(row, col) == currentPlayer)
        count = count + 1;
    else
        connected = false;
    end
    row = row - 1;
    col = col - 1;
end

%Going right and down.
row = tempRow + 1;
col = tempCol + 1;
while( (row <= 6) && (col <= 7) && connected)
   if(cF(row, col) == currentPlayer)
       count = count + 1;
   else
       connected = false;
   end
   row = row + 1;
   col = col + 1;
end


if(count < 4)
    count = 1;
    connected = true;
    row = tempRow + 1;
    col = tempCol - 1;
    
    %Going left and down
    while( (row <= 6) && (col >= 1) && connected )
        if(cF(row,col) == currentPlayer)
            count = count + 1;
        else
            connected = false;
        end
        col = col - 1;
        row = row + 1;
    end
    
    %Going right and up
    row = tempRow - 1;
    col = tempCol + 1;
    while( (row >= 1) && (col <= 7) && connected)
        if(cF(row,col) == currentPlayer)
            count = count + 1;
        else
            connected = false;
        end
        row = row - 1;
        col = col + 1;
    end
end

if(count >= 4)
    win = currentPlayer;
end

end
