import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.dropt.Dropt;


var dirt_blocks = [
    // Normal Dirt             Coarse Dirt
    [ <minecraft:dirt:0>    , <minecraft:dirt:1>      ], // Vanilla
    [ <biomesoplenty:dirt:0>, <biomesoplenty:dirt:8>  ], // Loamy
    [ <biomesoplenty:dirt:1>, <biomesoplenty:dirt:9>  ], // Sandy
    [ <biomesoplenty:dirt:2>, <biomesoplenty:dirt:10> ]  // Silty
] as IIngredient[][];

var pile_items = [
    <betterwithmods:dirt_pile>, // Vanilla
    <biomesoplenty:mudball>,    // Loamy
    <betterwithmods:sand_pile>, // Sandy
    <minecraft:clay_ball>       // Silty
] as IItemStack[];


// ===================
// Replace Block Drops
// ===================

function modify_dirt_drops(block as IIngredient, extra as IItemStack, pile as IItemStack) {
    Dropt.list("piles").add(Dropt.rule()
        .matchDrops([block])
        .replaceStrategy("REPLACE_ITEMS_IF_SELECTED")
        .dropStrategy("UNIQUE")
        .dropCount(Dropt.range(4))

        // Always drop a dirt pile.
        .addDrop(Dropt.drop().selector(Dropt.weight(1000000), "EXCLUDED")
                             .items([<betterwithmods:dirt_pile>]))
        // Drop the extra pile (gravel if coarse, dirt otherwise).
        .addDrop(Dropt.drop().selector(Dropt.weight(1000000), "EXCLUDED")
                             .items([extra]))
        // Drop the dirt-specific pile (dirt, mud, sand or clay).
        .addDrop(Dropt.drop().selector(Dropt.weight(1000000), "EXCLUDED")
                             .items([pile]))
        // Usually drop a dirt pile but sometimes gravel.
        // Drops dirt pile more often if Fortune enchantment is used.
        .addDrop(Dropt.drop().selector(Dropt.weight(18), "EXCLUDED")
                             .items([<betterwithmods:dirt_pile>]))
        .addDrop(Dropt.drop().selector(Dropt.weight(3, -1), "EXCLUDED")
                             .items([<betterwithmods:gravel_pile>]))
    );
}

for i, dirts in dirt_blocks {
    var normal = dirts[0];
    var coarse = dirts[1];
    var pile   = pile_items[i];
    modify_dirt_drops(normal, <betterwithmods:dirt_pile>, pile);
    modify_dirt_drops(coarse, <betterwithmods:gravel_pile>, pile);
}

// Drop sand piles from sand and red sand.
Dropt.list("piles").add(Dropt.rule()
    .matchDrops([<minecraft:sand:0>])
    .replaceStrategy("REPLACE_ITEMS_IF_SELECTED")
    .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                         .items([<betterwithmods:sand_pile>], Dropt.range(4))));
Dropt.list("piles").add(Dropt.rule()
    .matchDrops([<minecraft:sand:1>])
    .replaceStrategy("REPLACE_ITEMS_IF_SELECTED")
    .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                         .items([<betterwithmods:red_sand_pile>], Dropt.range(4))));

// Drop gravel piles (sometimes flint directly) from gravel.
// Drops flint more often if Fortune enchantment is used.
Dropt.list("piles").add(Dropt.rule()
    .matchDrops([<minecraft:gravel>])
    .replaceStrategy("REPLACE_ITEMS_IF_SELECTED")
    .dropStrategy("UNIQUE")
    .dropCount(Dropt.range(2))
    .addDrop(Dropt.drop().selector(Dropt.weight(1000000), "EXCLUDED")
                         .items([<betterwithmods:gravel_pile>], Dropt.range(3)))
    .addDrop(Dropt.drop().selector(Dropt.weight(9, -3), "EXCLUDED")
                         .items([<betterwithmods:gravel_pile>]))
    .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                         .items([<minecraft:flint>]))
);


// ======================
// Crafting Recipes (2x2)
// ======================

for i, dirts in dirt_blocks {
    var normal = dirts[0].itemArray[0] as IItemStack;
    var coarse = dirts[1].itemArray[0] as IItemStack;
    var pile   = pile_items[i];

    var normal_name = normal.displayName.toLowerCase() + "_from_piles";
    var coarse_name = coarse.displayName.toLowerCase() + "_from_piles";

    recipes.addShapeless(normal_name, normal, [
        <betterwithmods:dirt_pile>,
        <betterwithmods:dirt_pile>,
        <betterwithmods:dirt_pile>,
        pile
    ]);

    recipes.addShapeless(coarse_name, coarse, [
        <betterwithmods:gravel_pile>,
        <betterwithmods:dirt_pile>,
        <betterwithmods:dirt_pile>,
        pile
    ]);
}

if (REMOVE_CRAFTING) {
    recipes.addShapeless("gravel_from_piles", <minecraft:gravel>,
        [ <betterwithmods:gravel_pile>, <betterwithmods:gravel_pile>,
          <betterwithmods:gravel_pile>, <betterwithmods:gravel_pile> ]);
    recipes.addShapeless("sand_from_piles", <minecraft:sand:0>,
        [ <betterwithmods:sand_pile>, <betterwithmods:sand_pile>,
          <betterwithmods:sand_pile>, <betterwithmods:sand_pile> ]);
    recipes.addShapeless("red_sand_from_piles", <minecraft:sand:1>,
        [ <betterwithmods:red_sand_pile>, <betterwithmods:red_sand_pile>,
          <betterwithmods:red_sand_pile>, <betterwithmods:red_sand_pile> ]);
}
