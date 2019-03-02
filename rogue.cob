*> ---------------------------------
*> COBOL Rogue
*> by Ben Collier
*> for 7DRL 2019
*> 2/3/2019 to 9/3/19
*> ---------------------------------

identification division.
program-id. roguecobol.

environment division.
input-output section.

data division.

working-storage section.

01 gp-1.
  02 a pic 9(2) value 50.
  02 inputVar pic X(1) value "O".

*> Current map of level
01 map-table.
  02 map-row occurs 25 times.
    3 map-column occurs 80 times.
      4 map-cell pic x(1) value "x". 

*> Screen buffer
01 screen-table.
  02 screen-row occurs 25 times.
    03 screen-column occurs 80 times.
      04 screen-cell pic x(1) value " ".

procedure division.

*> ------------------------------------
*> Section: newGame
*> Perform all the actions necessary 
*> to start a new game.
*> ------------------------------------
newGame.
  perform wipeScreen.


*> ------------------------------------
*> Section: mainProcedure
*> Main loop - execute the main game 
*> loop.
*> ------------------------------------

mainProcedure.
  perform getInput.
  perform moveNPCs.
  perform wipeScreen.
  perform redrawScreen.
  perform showMessages.
  goback.


*> ------------------------------------
*> Section: createMap
*> Generate a new map for the current
*> level.
*> ------------------------------------

createMap.
  move '          xxxxxxxxxx          xxxxxxxxx          xxxxxxxxxx     ' to map-row(1).
  display " " at line 1 at column 1 erase to end of screen.
  display "@" at line 10 at column 10.
  display a at line 10 at column 20.
  display "Two-d table : " map-row(1).


*> -------------------------------------
*> Section: getInput
*> Wait for single character input and 
*> interpret it.
*> -------------------------------------

getInput.
  accept inputVar with auto-skip. 
  Display box-dos-bottom-left.
  display inputVar at line 10 at column 20
    with foreground-color 4, background-color 7.
  if inputVar is not equal to "q"
    then go to getInput.
  goback.


*> -------------------------------------
*> Section: moveNPCs
*> For each baddie currently present, 
*> work out their movement and/or action

moveNPCs section.
  goback.


*> -------------------------------------
*> Section: wipeScreen
*> Clear the screen

wipeScreen section.
  display " " at line 1 at column 1 erase to end of screen.


*> -------------------------------------
*> Section: redrawScreen
*> 
*> Redraw the screen from the buffer - 
*> draw parts of the map visible to the 
*> player, plus and NPCs and the 
*> character's icon.

redrawScreen section.
  goback.


*> -------------------------------------
*> Section: showMessages
*> 
*> Add any messages to the screen which 
*> have been generated in the previous 
*> turn.

showMessages section.
  goback.

*> -------------------------------------
*> Section: drawRoom
*> 
*> Draw a room

drawRoom section.
  Display box-dos-line-horizontal. 
  Display box-dos-line-vertical.   
  Display box-dos-top-left.          
  Display box-dos-top-right.       
  Display box-dos-bottom-left.       
  Display box-dos-bottom-right.     


*> -------------------------------------
*> End program - we shouldn't get here.
goback.

