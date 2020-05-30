#priority -100


var twine_mesh   = <hardcorebytesmod:twine_mesh>;
var string_mesh  = <hardcorebytesmod:string_mesh>;
var twine_sieve  = <hardcorebytesmod:primitive_twine_sieve>;
var string_sieve = <hardcorebytesmod:primitive_string_sieve>;


// ======================
// Ore Dictionary Entries
// ======================

var sieves = <ore:sievePrimitive>;
sieves.add(twine_sieve);
sieves.add(string_sieve);


// ======================
// Crafting Recipes (2x2)
// ======================

// Meshes

var twine = <pyrotech:material:14>;
recipes.addShaped("twine_mesh", twine_mesh,
    [[ twine, twine ],
     [ twine, twine ]]);

// TODO: Craft string mesh in tailor's worktable.
var string_ = <minecraft:string>; // "string" is a keyword :(
recipes.addShaped("string_mesh", string_mesh,
    [[ string_, string_ ],
     [ string_, string_ ]]);


// Primitive Sieves

var stick = <minecraft:stick>;
recipes.addShapeless("primitive_twine_sieve", twine_sieve,
    [ twine_mesh, stick, stick ]);
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
