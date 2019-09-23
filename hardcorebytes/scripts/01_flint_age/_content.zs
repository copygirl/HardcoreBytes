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


// == Flint Hatchet + Head ==

var flint_hatchet_head = VanillaFactory.createItem("flint_hatchet_head");
flint_hatchet_head.register();

var flint_hatchet = VanillaFactory.createItem("flint_hatchet");
flint_hatchet.toolClass = "axe";
flint_hatchet.toolLevel = 1;
flint_hatchet.maxStackSize = 1;
flint_hatchet.maxDamage = 48;
flint_hatchet.itemDestroySpeed = function(stack, blockState) {
    var definition  = blockState.block.definition;
    var harvestTool = definition.harvestTool;
    if (harvestTool == "axe") {
        // Leaves break super fast!
        if (definition.unlocalizedName has "leaves") return 80.0F;
        else return 4.0F;
    } else return 1.0F;
};
flint_hatchet.itemDestroyedBlock = function(stack, ctWorld, ctBlockState, ctPos, entity) {
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
flint_hatchet.register();


// == Flint Knife + Blade ==

var flint_knife_blade = VanillaFactory.createItem("flint_knife_blade");
flint_knife_blade.register();

var flint_knife = VanillaFactory.createItem("flint_knife");
flint_knife.maxStackSize = 1;
flint_knife.maxDamage = 64;
flint_knife.itemDestroyedBlock = function(stack, world, blockState, pos, entity) {
    stack.damage(1, entity);
    return true;
};
flint_knife.register();
