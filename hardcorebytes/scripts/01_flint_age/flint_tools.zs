
var stick   = <minecraft:stick>;
var flint   = <minecraft:flint>;
var binding = <ore:toolBindingPrimitive>;

var knife_blade  = <hardcorebytesmod:flint_knife_blade>;
var spade_head   = <hardcorebytesmod:flint_spade_head>;
var hatchet_head = <hardcorebytesmod:flint_hatchet_head>;
var hoe_head     = <hardcorebytesmod:flint_hoe_head>;

var knife   = <hardcorebytesmod:primitive_flint_knife>;
var spade   = <hardcorebytesmod:primitive_flint_spade>;
var hatchet = <hardcorebytesmod:primitive_flint_hatchet>;
var hoe     = <hardcorebytesmod:primitive_flint_hoe>;


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

recipes.addShaped("flint_knife_blade", knife_blade,
    [[ null , flint ],
     [ flint, null  ]]);

recipes.addShaped("flint_spade_head", spade_head,
    [[ flint ],
     [ flint ]]);

recipes.addShaped("flint_hatchet_head", hatchet_head,
    [[ flint, flint ],
     [ flint, null  ]]);

recipes.addShaped("flint_hoe_head", hoe_head,
    [[ flint, flint ]]);


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
     [ stick  , binding      ]]);
