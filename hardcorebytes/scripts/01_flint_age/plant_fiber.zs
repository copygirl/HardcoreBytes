#priority -100

import mods.dropt.Dropt;


// ======================
// Additional block drops
// ======================

static LOW_CHANCE_WEIGHT    as int = 10;
static MEDIUM_CHANCE_WEIGHT as int =  6;
static HIGH_CHANCE_WEIGHT   as int =  3;

var low_chance_plant_fiber = [
    "biomesoplenty:plant_0:0",  // Short Grass
    "biomesoplenty:plant_0:1",  // Medium Grass
    "biomesoplenty:plant_0:13", // Dead Grass
    "biomesoplenty:plant_0:14", // Desert Grass
    "biomesoplenty:plant_1:0"   // Dune Grass
] as string[];

var medium_chance_plant_fiber = [
    "minecraft:tallgrass:1",    // Grass
    "minecraft:tallgrass:2",    // Fern
    "biomesoplenty:plant_0:3",  // Sprout
    "biomesoplenty:plant_0:7",  // Wheat Grass
    "biomesoplenty:plant_0:8",  // Damp Grass
    "biomesoplenty:plant_0:9",  // Koru
    "biomesoplenty:plant_1:7",  // Devilweed
    "minecraft:vine",           // Vine
    "biomesoplenty:ivy",        // Ivy
    "biomesoplenty:willow_vine" // Willow Vine
] as string[];

var high_chance_plant_fiber = [
    "minecraft:double_plant:2", // Double Tallgrass
    "minecraft:double_plant:3"  // Large Fern
] as string[];

var stick_and_plant_fiber = [
    "biomesoplenty:plant_0:6", // Shrub
    "biomesoplenty:plant_0:2", // Bush
    "biomesoplenty:plant_0:5"  // Berry Bush
] as string[];


function drop_plant_fiber(blocks as string[], chance as int) {
    // With the proper tool you gather plant fiber 4x more efficiently.
    Dropt.list("plant_fiber").add(Dropt.rule()
        .matchBlocks(blocks)
        .matchHarvester(Dropt.harvester()
            .mainHand("WHITELIST", <ore:toolGatherPlantFiber>.itemArray))
        .replaceStrategy("ADD")
        .addDrop(Dropt.drop().selector(Dropt.weight(4), "EXCLUDED")
                            .items([<hardcorebytesmod:plant_fiber>]))
        .addDrop(Dropt.drop().selector(Dropt.weight(chance - 1)))
    );
    // Without it.. well, get punchin'!
    Dropt.list("plant_fiber").add(Dropt.rule()
        .matchBlocks(blocks)
        .matchHarvester(Dropt.harvester()
            .mainHand("BLACKLIST", <ore:toolGatherPlantFiber>.itemArray))
        .replaceStrategy("ADD")
        .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                            .items([<hardcorebytesmod:plant_fiber>]))
        .addDrop(Dropt.drop().selector(Dropt.weight(chance - 1)))
    );
}

// Somtimes drop plant fiber from ground plants.
drop_plant_fiber(low_chance_plant_fiber, LOW_CHANCE_WEIGHT);
drop_plant_fiber(medium_chance_plant_fiber, MEDIUM_CHANCE_WEIGHT);
drop_plant_fiber(high_chance_plant_fiber, HIGH_CHANCE_WEIGHT);


// Drop 1-2 sticks and 0-2 plant fiber from bush-like plants.
Dropt.list("plant_fiber").add(Dropt.rule()
    .matchBlocks(stick_and_plant_fiber)
    .replaceStrategy("ADD")
    .dropStrategy("UNIQUE")
    .dropCount(Dropt.range(2))
    .addDrop(Dropt.drop().items([<hardcorebytesmod:plant_fiber>], Dropt.range(0, 2)))
    .addDrop(Dropt.drop().items([<minecraft:stick>], Dropt.range(1, 2))));
