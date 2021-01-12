# DST PositionRecipe Mod
In Don't Starve, using the AddRecipe function automatically sends the recipe to the bottom of the crafting tab, which can be a little annoying. This mod adds a function that allows other mods to easily reposition crafting recipes in their crafting tabs.
 
## Download
To use the functionality of this mod, download this repository as a ZIP file and unzip it into the mods folder. This will add PositionRecipe to the Global singleton. Probably not the best idea if you plan on publishing your mod, if this mod is not on the steam workshop yet (it's not).

Alternatively, you can go to the [modmain](https://github.com/domo106/DST-PositionRecipe-Mod/blob/main/modmain.lua) and copy/paste the PositionRecipe into your code. If you do this, you'll want to call PositionRecipe without the "GLOBAL." before it.

## Usage
Once the mod is in the mods folder you can use the function added to the GLOBAL singleton. If you've copy/pasted the function, use it like a normal function:

`GLOBAL.PositionRecipe(recipe_name, position)`

The recipe_name variable is the prefab name of the output of the recipe. The position is the index (starting at 1) in which the recipe will be positioned in its tab. 
For example, to move the Axe to the fourth position, you would use the function like this:

`GLOBAL.PositionRecipe("axe", 4)`

Keep in mind that by default, some crafting recipes are hidden in the crafting tab until you are next to certain crafting structures. So the previous example will appear to move the axe to the second position, until the Luxury Axe and Opulent Pickaxe are available.
