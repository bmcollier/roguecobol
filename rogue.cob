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

*> Input buffer
01 inputVar pic X(1).


*> Character location
01 location.
  02 locationX pic 9(2) value 40.
  02 locationY pic 9(2) value 12.

*> Current map of level
01 map-table.
  02 map-row occurs 25 times.
    03 map-column occurs 80 times.
      04 map-cell pic x(1) value "x".

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
  perform until inputVar is equal to "q"
    perform getInput
    perform moveNPCs
    perform wipeScreen
    perform redrawScreen
    perform showMessages
  end-perform.
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
  display "Two-d table : " map-row(1).


*> -------------------------------------
*> Section: getInput
*> Wait for single character input and 
*> interpret it.
*> -------------------------------------


getInput.
  accept inputVar with auto-skip.
  if inputVar is equal to "w"
    then subtract 1 from locationY.
  if inputVar is equal to "s"
    then add 1 to locationY.
  if inputVar is equal to "a"
    then subtract 1 from locationX.
  if inputVar is equal to "d"
    then add 1 to locationX.


*> -------------------------------------
*> Section: moveNPCs
*> For each baddie currently present, 
*> work out their movement and/or action

moveNPCs section.


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
  display "@" at line locationY at column locationX
    foreground-color 13
    highlight.
  call "drawRoom" using 10, 10, 20, 20.

*> -------------------------------------
*> Section: showMessages
*> 
*> Add any messages to the screen which 
*> have been generated in the previous 
*> turn.

showMessages section.


*> -------------------------------------
*> Subprogram: drawRoom
*> 
*> Draw a room
identification division.
program-id. drawRoom.
data division.
working-storage section.
01 brushX pic 9(2) usage is binary.
01 brushY pic 9(2) usage is binary.
linkage section.
01 startX pic 9(2) usage is binary.
01 startY pic 9(2) usage is binary.
01 endX pic 9(2) usage is binary.
01 endY pic 9(2) usage is binary.
procedure division using startX startY endX endY.
doDrawRoom.
  perform varying brushX from startX by 1 until brushX > endX
    display "-" at line startY col brushX
      foreground-color is 7
      background-color is 4
  end-perform.
  perform varying brushX from startX by 1 until brushX > endX
    display "-" at line endY col brushX
      foreground-color is 7
      background-color is 4
  end-perform.
  perform varying brushY from startY by 1 until brushY > endY
    display "|" at line brushY col startX
      foreground-color is 7
      background-color is 4
  end-perform.
  perform varying brushY from startY by 1 until brushY > endY
    display "|" at line brushY col endX
      foreground-color is 7
      background-color is 4
  end-perform.
  display "+" at line startY col startX foreground-color is 7 background-color is 4.
  display "+" at line startY col endX foreground-color is 7 background-color is 4.
  display "+" at line endY col startX foreground-color is 7 background-color is 4.
  display "+" at line endY col endX foreground-color is 7 background-color is 4.
  exit program.
end program drawRoom.

