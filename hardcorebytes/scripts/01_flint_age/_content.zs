#loader contenttweaker

import crafttweaker.block.IBlockProperties;
import crafttweaker.block.IBlockState;
import crafttweaker.util.Position3f;
import mods.contenttweaker.VanillaFactory;


// ==================================
// Register items with ContentTweaker
// ==================================

var plant_fiber = VanillaFactory.createItem("plant_fiber");
plant_fiber.register();


// == Meshes and Sieves ==

var plant_fiber_mesh = VanillaFactory.createItem("plant_fiber_mesh");
plant_fiber_mesh.maxStackSize = 1;
plant_fiber_mesh.register();

var string_mesh = VanillaFactory.createItem("string_mesh");
string_mesh.maxStackSize = 1;
string_mesh.register();

var primitive_plant_fiber_sieve = VanillaFactory.createItem("primitive_plant_fiber_sieve");
primitive_plant_fiber_sieve.maxStackSize = 1;
primitive_plant_fiber_sieve.maxDamage = 20;
primitive_plant_fiber_sieve.itemGetContainerItem = function(stack) {
    return stack.withDamage(stack.damage + 1);
};
primitive_plant_fiber_sieve.register();

var primitive_string_sieve = VanillaFactory.createItem("primitive_string_sieve");
primitive_string_sieve.maxStackSize = 1;
primitive_string_sieve.maxDamage = 64;
primitive_string_sieve.itemGetContainerItem = function(stack) {
    return stack.withDamage(stack.damage + 1);
};
primitive_string_sieve.register();


// == Primitive Flint Hatchet + Head ==

var hatchet_head = VanillaFactory.createItem("flint_hatchet_head");
hatchet_head.register();

var hatchet = VanillaFactory.createItem("primitive_flint_hatchet");
hatchet.toolClass = "axe";
hatchet.toolLevel = 1;
hatchet.maxStackSize = 1;
hatchet.maxDamage = 48;
hatchet.itemDestroySpeed = function(stack, blockState) {
    var definition  = blockState.block.definition;
    var harvestTool = definition.harvestTool;
    if (harvestTool == "axe") {
        // Leaves break super fast!
        if (definition.unlocalizedName has "leaves") return 80.0F;
        else return 4.0F;
    } else return 1.0F;
};
hatchet.itemDestroyedBlock = function(stack, ctWorld, ctBlockState, ctPos, entity) {
    // Why the heck is this so complicated?
    // ContentTweaker has its own world, block state and position.
    // Thankfully, the entity is based on CraftTweaker's IEntity.
    var world = entity.world;
    var pos3f = Position3f.create(ctPos.x, ctPos.y, ctPos.z);
    var pos   = pos3f.asBlockPos();
    var blockState = world.getBlockState(pos);
    var hardness   = blockState.getBlockHardness(world, pos);
    // Only damage the item if the block does not
    // break instantly, just like Vanilla tools.
    if (hardness > 0.0F) {
        var name = blockState.block.definition.unlocalizedName;
        // When breaking leaves there's only a 20% chance to damage the tool.
        if (!(name has "leaves") || (ctWorld.random.nextInt(5) == 0))
            stack.damage(1, entity);
    }
    return true;
};
hatchet.register();


// == Primitive Flint Knife + Blade ==

var knife_blade = VanillaFactory.createItem("flint_knife_blade");
knife_blade.register();

var knife = VanillaFactory.createItem("primitive_flint_knife");
knife.maxStackSize = 1;
knife.maxDamage = 64;
knife.itemDestroyedBlock = function(stack, world, blockState, pos, entity) {
    stack.damage(1, entity);
    return true;
};
knife.register();
