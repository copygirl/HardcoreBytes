#priority 100
import crafttweaker.recipes.IFurnaceRecipe;


// == Crafting Table ==

if (REMOVE_CRAFTING)
    recipes.removeAll();


// == Furnace ==

// Remove all non-food furnace recipes.
if (REMOVE_FURNACE)
    for recipe in furnace.all
        if (!recipe.output.isFood)
            furnace.remove(recipe.output);
