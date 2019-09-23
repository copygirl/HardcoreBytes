import mods.jei.JEI;


var stick   = <minecraft:stick>;
var flint   = <minecraft:flint>;
var binding = <ore:toolBindingPrimitive>;

var hatchet_head = <contenttweaker:flint_hatchet_head>;
var knife_blade  = <contenttweaker:flint_knife_blade>;
var hatchet = <contenttweaker:primitive_flint_hatchet>;
var knife   = <contenttweaker:primitive_flint_knife>;


// ======================
// Ore Dictionary Entries
// ======================

binding.add(<minecraft:string>);
binding.add(<contenttweaker:plant_fiber>);
// TODO: Add hemp fiber as well?

// Flint Knife is able to gather plant fiber better.
<ore:toolGatherPlantFiber>.add(knife);


// ========================
// Show Custom Items in JEI
// ========================

// Hidden items are removed after added items are added.
// Adding without hiding doesn't appear to have an effect?
// Thus, items taken from JEI don't have the right attributes.

// JEI.hide(hatchet);
// JEI.hide(knife);
// JEI.addItem(hatchet_nbt);
// JEI.addItem(knife_nbt);


// ======================
// Crafting Recipes (2x2)
// ======================


// == Tool Heads ==

recipes.addShaped("flint_hatchet_head", hatchet_head,
    [[ flint, flint ],
     [ flint, null  ]]);

recipes.addShaped("flint_knife_blade", knife_blade,
    [[ flint ],
     [ flint ]]);


// == Tools ==

// Hatchet has 5 damage and 1.2 speed.
var hatchet_nbt = hatchet.withTag({
    AttributeModifiers: [
        { UUIDMost: 1, UUIDLeast: 1, Slot: "mainhand", AttributeName: "generic.attackDamage", Name: "generic.attackDamage", Operation: 0, Amount:    4 },
        { UUIDMost: 1, UUIDLeast: 2, Slot: "mainhand", AttributeName: "generic.attackDamage", Name: "generic.attackDamage", Operation: 0, Amount: -2.8 }
    ]});

// Knife has 3 damage and 2.4 speed.
var knife_nbt = knife.withTag({
    AttributeModifiers: [
        { UUIDMost: 1, UUIDLeast: 1, Slot: "mainhand", AttributeName: "generic.attackDamage", Name: "generic.attackDamage", Operation: 0, Amount:    2 },
        { UUIDMost: 1, UUIDLeast: 2, Slot: "mainhand", AttributeName: "generic.attackDamage", Name: "generic.attackDamage", Operation: 0, Amount: -1.6 }
    ]});

recipes.addShaped("primitive_flint_hatchet", hatchet_nbt,
    [[ binding, hatchet_head ],
     [ stick  , binding      ]]);

recipes.addShaped("primitive_flint_knife", knife_nbt,
    [[ binding, knife_blade ],
     [ stick  , binding     ]]);
