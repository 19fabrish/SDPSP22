clc
clear

%Initialize Scene
myScene = simpleGameEngine("c4.png", 20,20,5,[0,0,0]);

running = 1;
empty = 1;
red = 2;
black = 3;
playerWin = 0;

playerOneName = input('Player One, what is your name?: ', 's');
playerTwoName = input('Player Two, what is your name?: ', 's');
playerNames = [playerOneName, playerTwoName];




while(running)
    
    currentPlayer = 2;
    cF = empty * ones(6,7);
    drawScene(myScene, cF);
    
    while(~playerWin)

        fprintf('%s, please click a column to drop a chip into.\n', playerNames(currentPlayer-1));
        [row, col] = dropChip(cF, myScene, playerNames(currentPlayer-1));
        cF(row, col) = currentPlayer;
        drawScene(myScene, cF);
        
        
        win1 = horizCheck(cF, currentPlayer, row, col);
        win2 = vertCheck(cF, currentPlayer, col, row);
        win3 = diagCheck(cF, currentPlayer, row, col);
        
        if(win1 || win2 || win3)
            fprintf('Wow! The MadMan does it again! %s has won!\n', playerNames(currentPlayer-1));
            playerWin = currentPlayer;
        end
        
        drawScene(myScene, cF);
        
        if(currentPlayer == 2)
            currentPlayer = 3;
        else
            currentPlayer = 2;
        end
        
    end
    
    response = input('Would you like to play again?: ', 's');
    
    if(strcmp(response, 'yes') || strcmp(response, 'Yes'))
        fprintf('Enjoy your rematch lol.\n');
        playerWin = 0;
    else
        fprintf('Response interpreted as "no." Have a nice day buddy.\n');
        running = false;
    end
end