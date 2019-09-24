#priority -100


var plant_fiber = <hardcorebytesmod:plant_fiber>;
var string_     = <minecraft:string>; // "string" is a keyword.
var stick       = <minecraft:stick>;

var plant_fiber_mesh = <hardcorebytesmod:plant_fiber_mesh>;
var string_mesh      = <hardcorebytesmod:string_mesh>;
var plant_fiber_sieve = <hardcorebytesmod:primitive_plant_fiber_sieve>;
var string_sieve      = <hardcorebytesmod:primitive_string_sieve>;


// ======================
// Ore Dictionary Entries
// ======================

var sieves = <ore:sievePrimitive>;
sieves.add(plant_fiber_sieve);
sieves.add(string_sieve);


// ======================
// Crafting Recipes (2x2)
// ======================

// Meshes

recipes.addShaped("plant_fiber_mesh", plant_fiber_mesh,
    [[ plant_fiber, plant_fiber ],
     [ plant_fiber, plant_fiber ]]);

// TODO: Craft string mesh in tailor's worktable.
recipes.addShaped("string_mesh", string_mesh,
    [[ string_, string_ ],
     [ string_, string_ ]]);


// Primitive Sieves

recipes.addShapeless("primitive_plant_fiber_sieve", plant_fiber_sieve,
    [ plant_fiber_mesh, stick, stick ]);

recipes.addShapeless("primitive_string_sieve", string_sieve,
    [ string_mesh, stick, stick ]);


// Sieve + Gravel Pile => Flint

for sieve in sieves.items {
    var name_parts = sieve.name.split("\\.");
    var sieve_name = name_parts[name_parts.length - 1];
    recipes.addShapeless(sieve_name + "_gravel_to_flint",
        <minecraft:flint>,
        [ sieve.anyDamage(), <betterwithmods:gravel_pile> ]);
}
