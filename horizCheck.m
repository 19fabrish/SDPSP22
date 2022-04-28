function [win] = horizCheck(cF, currentPlayer, row, col)

win = 0;
count = 1;
connected = true;
tempCol = col;
col = col - 1;

%Going Left
while( (col >= 1) && (connected) )
    if(cF(row, col) == currentPlayer)
        count = count + 1;
    else
        connected = false;
    end
    col = col - 1;
end



if(count < 4)
    col = tempCol + 1;
    connected = true;
    %Going Right
    while( (col <= 7) && (connected) )
        if(cF(row, col) == currentPlayer)
            count = count + 1;
        else
            connected = false;
        end
        col = col + 1;
    end 
end

if(count >= 4)
   win = currentPlayer; 
end

end


