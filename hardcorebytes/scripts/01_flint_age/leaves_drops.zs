import mods.dropt.Dropt;


var leaves = [
    // Vanilla
    "minecraft:leaves:*",
    "minecraft:leaves2:*",
    // Biomes O' Plenty
    "biomesoplenty:leaves_0:*",
    "biomesoplenty:leaves_1:*",
    "biomesoplenty:leaves_2:*",
    "biomesoplenty:leaves_3:*",
    "biomesoplenty:leaves_4:*",
    "biomesoplenty:leaves_5:*",
    "biomesoplenty:leaves_6:*",
    // Thaumcraft
    "thaumcraft:leaves_greatwood:*",
    "thaumcraft:leaves_silverwood:*",

    // Dynamic Trees (Vanilla)
    "dynamictrees:leaves0:*",
    "dynamictrees:leaves1:*",
    // Dynamic Trees (Biomes O' Plenty)
    "dynamictreesbop:leaves0:*",
    "dynamictreesbop:leaves1:*",
    "dynamictreesbop:leaves2:*",
    "dynamictreesbop:leaves3:*",
    "dynamictreesbop:leaves4:*",
    "dynamictreesbop:leaves5:*",
    "dynamictreesbop:leaves6:*",
    "dynamictreesbop:leaves7:*",
    "dynamictreesbop:leaves_flowering:*",
    "dynamictreesbop:leaves_palm:*",
    // Dynamic Trees (Thaumcraft)
    "dynamictreestc:leaves0:*",
    "dynamictreestc:leaves_silverwood:*"
] as string[];


// ======================
// Additional block drops
// ======================

Dropt.list("plant_fiber").add(Dropt.rule()
    .matchBlocks(leaves)
    .replaceStrategy("ADD")
    .addDrop(Dropt.drop().selector(Dropt.weight(1), "EXCLUDED")
                         .items([<minecraft:stick>]))
    .addDrop(Dropt.drop().selector(Dropt.weight(1)))
);
