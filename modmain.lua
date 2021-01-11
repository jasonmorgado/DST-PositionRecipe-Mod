GLOBAL.require("constants")

recipe_table = GLOBAL.AllRecipes

function PositionRecipe(recname, index)
    -- Repositions a recipe in the recipe table to a given index
    -- Reminder that indexes start at 1

    local recipe_to_move = recipe_table[recname]
    if recipe_to_move == nil then return end
    
    -- Find sortkeys used in tab
    local tab_to_sort = recipe_to_move.tab
    local relative_indexes = {}
    for recipe_name, recipe in pairs(recipe_table) do
        if recipe.tab == tab_to_sort then
            table.insert(relative_indexes, recipe.sortkey)
            print("Inserting key:",recipe.sortkey)
        end
    end

    -- Sort the keys found in the tab
    table.sort(relative_indexes, function(a,b) return a < b end)
    for k,v in ipairs(relative_indexes) do
        print("KV",k,v)
    end
    -- Calculate new index
    local new_index = relative_indexes[index]
    recipe_table[recname].sortkey = new_index
    print("Giving item", recname, "new index:", new_index)

    -- Move every recipe up 1 to avoid conflicts
    for recipe_name, recipe in pairs(recipe_table) do
        if recipe.sortkey == nil or new_index == nil then print("?",recipe.sortkey,new_index) return end
        if recipe.sortkey >= new_index then
            print("Recipe number:",recipe.sortkey,"increased by 1")
            recipe.sortkey = recipe.sortkey + 1
        end
    end
end

GLOBAL.PositionRecipe = PositionRecipe

-- Example of Usage here:
-- GLOBAL.PositionRecipe("axe", 4) -- Puts researchlab at fourth position in the science tab
-- Keep in mind there are hidden crafting recipes in the tab that are revealed with science machine.
