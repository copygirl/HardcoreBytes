import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.dropt.Dropt;


// The chance (1/X) for a gravel pile to drop from
// breaking a dirt block instead of a dirt pile.
// Allows harvesting flint in gravel-sparse places.
static DIRT_GRAVEL_WEIGHT as int = 6;

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


// ======================
// Additional Block Drops
// ======================


function modify_dirt_drops(block as IIngredient, extra as IItemStack, pile as IItemStack) {
    var dirt_gravel_drop_array = [<betterwithmods:gravel_pile>] as IItemStack[];
    for i in 0 to DIRT_GRAVEL_WEIGHT { dirt_gravel_drop_array += <betterwithmods:dirt_pile>; }

    Dropt.list("dirt_piles").add(Dropt.rule()
        .matchDrops([block])
        .replaceStrategy("REPLACE_ITEMS_IF_SELECTED")
        .dropStrategy("UNIQUE")
        .dropCount(Dropt.range(4))

        // Always drop a dirt pile.
        .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                             .items([<betterwithmods:dirt_pile>]))
        // Usually drop a dirt pile but sometimes gravel.
        .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                             .items(dirt_gravel_drop_array))
        // Drop the extra pile (gravel if coarse, dirt otherwise).
        .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                             .items([extra]))
        // Drop the dirt-specific pile (dirt, mud, sand or clay).
        .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                             .items([pile]))
    );
}

for i, dirts in dirt_blocks {
    var normal = dirts[0];
    var coarse = dirts[1];
    var pile   = pile_items[i];
    modify_dirt_drops(normal, <betterwithmods:dirt_pile>, pile);
    modify_dirt_drops(coarse, <betterwithmods:gravel_pile>, pile);
}


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
