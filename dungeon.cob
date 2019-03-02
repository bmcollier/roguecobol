*> -------------------------------------
*> Dungeon creator
*> Subprogram for COBOL Rogue
*> -------------------------------------
identification division.
program-id. dungeon.

environment division.
input-output section.

data division.

working-storage section.

*> Cursor for room creation
01 levelCursor.
  02 createX pic 9(2) usage is binary.
  02 createY pic 9(2) usage is binary.

*> Map of level
01 map-table.
  02 map-row occurs 25 times.
    03 map-column occurs 80 times.
      04 map-cell pic x(1) value " ".

procedure division.

*> -------------------------------------
*> Section: genDungeon
*>
*> Generate the dungeon, innit
*> -------------------------------
genDungeon section.
  perform wipeMap.
  move 40 to createX.
  move 12 to createY.
  perform addRoom.
  genFeature.
  perform genNewFeature.
  perform pickWall.
  perform checkMapForSpace.
  if spaceExists is not equal to 1
    then go to genFeature.
  perform addFeature.
  if numberRooms is not greater than 5
    then go to genFeature.
  perform addStaircases.
  perform seedMonsters.


*> -------------------------------------
*> Section: wipeMap
*>
*> Wipe the existing map
*> -------------------------------------
wipeMap section.
  move " " to map-table(1,1)
  move " " to map-table(1,2)


*> -------------------------------------
*> Section: addRoom
*>
*> Add a room to the map
*> -------------------------------------
addRoom section.
  move " " to map-table(1,1)
  move " " to map-table(1,2)

*> -------------------------------------
*> Section: genNewFeature
*>
*> Wipe the existing map
*> -------------------------------------
genNewFeature section.
  move " " to map-table(1,1)
  move " " to map-table(1,2)

*> -------------------------------------
*> Section: pickWall
*>
*> Wipe the existing map
*> -------------------------------------
pickWall section.
  move " " to map-table(1,1)
  move " " to map-table(1,2)

*> -------------------------------------
*> Section: checkMapForSpace
*>
*> Wipe the existing map
*> -------------------------------------
checkMapForSpace section.
  move " " to map-table(1,1)
  move " " to map-table(1,2)

*> -------------------------------------
*> Section: addFeature
*>
*> Wipe the existing map
*> -------------------------------------
addFeature section.
  move " " to map-table(1,1)
  move " " to map-table(1,2)

*> -------------------------------------
*> Section: addStaircases
*>
*> Wipe the existing map
*> -------------------------------------
wipeMap section.
  move " " to map-table(1,1)
  move " " to map-table(1,2)

*> -------------------------------------
*> Section: seedMonsters
*>
*> Wipe the existing map
*> -------------------------------------
wipeMap section.
  move " " to map-table(1,1)
  move " " to map-table(1,2)
