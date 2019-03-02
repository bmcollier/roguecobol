# roguecobol
Roguelike written in GnuCobol for 7DRL 2019.

COBOL
-----

I wrote a little bit of COBOL twenty years ago. We have some legacy systems at my current client which are COBOL-based, so even though I don't have to touch those apps, I thought I'd give this a go, out of interest really. COBOL has its charms, and some of the data structures are clever enough to make me wonder if other languages could benefit from copying them.


Dungeon Creation
----------------

For creating the dungeon, I'm implmenting the algorithm on roguebasin.com:

* Fill the whole map with solid earth
* Dig out a single room in the centre of the map
* Pick a wall of any room
* Decide upon a new feature to build
* See if there is room to add the new feature through the chosen wall
* If yes, continue. If no, go back to step 3
* Add the feature through the chosen wall
* Go back to step 3, until the dungeon is complete
* Add the up and down staircases at random points in map
* Finally, sprinkle some monsters and items liberally over dungeon 
