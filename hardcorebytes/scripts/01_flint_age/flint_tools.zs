import crafttweaker.item.IItemStack;

var stick   = <minecraft:stick>;
var flint   = <minecraft:flint>;
var binding = <ore:toolBindingPrimitive>;

var knife_blade  = <hardcorebytesmod:flint_knife_blade>;
var spade_head   = <hardcorebytesmod:flint_spade_head>;
var hatchet_head = <hardcorebytesmod:flint_hatchet_head>;
var hoe_head     = <hardcorebytesmod:flint_hoe_head>;
var hammer_head  = <hardcorebytesmod:flint_hammer_head>;

var knife   = <hardcorebytesmod:primitive_flint_knife>;
var spade   = <hardcorebytesmod:primitive_flint_spade>;
var hatchet = <hardcorebytesmod:primitive_flint_hatchet>;
var hoe     = <hardcorebytesmod:primitive_flint_hoe>;
var hammer  = <hardcorebytesmod:primitive_flint_hammer>;


// ======================
// Ore Dictionary Entries
// ======================

binding.add(<minecraft:string>);
binding.add(<hardcorebytesmod:plant_fiber>);
// TODO: Add hemp fiber as well?

// Flint Knife is able to gather plant fiber better.
<ore:toolGatherPlantFiber>.add(knife);


// ======================
// Crafting Recipes (2x2)
// ======================


// == Tool Heads ==

recipes.addShaped("flint_knife_blade",
    knife_blade.withDamage(knife_blade.maxDamage),
    [[ null , flint ],
     [ flint, null  ]]);

recipes.addShaped("flint_spade_head",
    spade_head.withDamage(spade_head.maxDamage),
    [[ flint ],
     [ flint ]]);

recipes.addShaped("flint_hatchet_head",
    hatchet_head.withDamage(hatchet_head.maxDamage),
    [[ flint, flint ],
     [ flint, null  ]]);

recipes.addShaped("flint_hoe_head",
    hoe_head.withDamage(hoe_head.maxDamage),
    [[ flint, flint ]]);

recipes.addShaped("flint_hammer_head",
    hammer_head.withDamage(hammer_head.maxDamage),
    [[ flint, null  ],
     [ null , flint ]]);


// == Tools ==

recipes.addShaped("primitive_flint_knife", knife,
    [[ binding, knife_blade ],
     [ stick  , binding     ]]);

recipes.addShaped("primitive_flint_spade", spade,
    [[ binding, spade_head ],
     [ stick  , binding    ]]);

recipes.addShaped("primitive_flint_hatchet", hatchet,
    [[ binding, hatchet_head ],
     [ stick  , binding      ]]);

recipes.addShaped("primitive_flint_hoe", hoe,
    [[ binding, hoe_head ],
     [ stick  , binding  ]]);

recipes.addShaped("primitive_flint_hammer", hammer,
    [[ binding, hammer_head ],
     [ stick  , binding     ]]);


// == Tool Repairing with Flint ==

var tools_2flint = [
    <hardcorebytesmod:primitive_flint_knife>,
    <hardcorebytesmod:primitive_flint_spade>,
    <hardcorebytesmod:primitive_flint_hoe>,
// Doesn't make sense to "sharpen" a hammer.
//  <hardcorebytesmod:primitive_flint_hammer>,
] as IItemStack[];

var tools_3flint = [
    <hardcorebytesmod:primitive_flint_hatchet>,
] as IItemStack[];

for tool in tools_2flint {
    var name = tool.displayName.toLowerCase();
    recipes.addShapeless("repair_" + name, tool,
        [ tool.anyDamage().marked("tool"), flint ],
        function(out, ins, cInfo) {
            var newDamage = max(0, ins.tool.damage - 32);
            return ins.tool.withDamage(newDamage);
        }, null);
}

for tool in tools_3flint {
    var name = tool.displayName.toLowerCase();
    recipes.addShapeless("repair_" + name, tool,
        [ tool.anyDamage().marked("tool"), flint ],
        function(out, ins, cInfo) {
            var newDamage = max(0, ins.tool.damage - 24);
            return ins.tool.withDamage(newDamage);
        }, null);
}
