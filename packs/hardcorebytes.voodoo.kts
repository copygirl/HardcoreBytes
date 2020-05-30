title     = "Hardcore Bytes"
authors   = listOf("copygirl")
version   = "0.0.1"
icon      = rootFolder.resolve("icon.png")

mcVersion = "1.12.2"
modloader { forge(Forge.mc1_12_2_latest) }

pack {
    multimc {
        selfupdateUrl = "https://meowface.org/copygirl/HardcoreBytes/hardcorebytes.json"
    }
    experimental {
        userFiles = FnPatternList(include = listOf(
            "options.txt"
        ))
    }
}

root<Curse> {
    releaseTypes = setOf(FileType.Release, FileType.Beta, FileType.Alpha)

    // COMMON MODS
    it.list {
        // Libraries
        +Mod.applecore   // Food related library, required for BWM's HCHunger
        +Mod.baubles     // Adds 7 more equipment slots for items
        +Mod.mcmultipart // Allows certain blocks to fit in a single block space
        +Mod.shadowfactsForgelin // FIXME: Required because wonky depenceny resolution

        // World Generation
        +Mod.biomesOPlenty // More biomes and content
        +Mod.geolosys      // Ores spawn in rare, huge veins
        +Mod.dynamictrees  // Pretty trees that grow over time
            +Mod.dtbop     // - Biomes O' Plenty compatibility
            +Mod.dttc      // - Thaumcraft compatibility

        // Gameplay Changes
        +Mod.sereneSeasons         // Seasons!
        +Mod.toolBelt              // Switch tools on the fly
        +Mod.toughAsNails          // Temperature and thirst
            +Mod.armorUnderwearMod // - Add TaN linings to any armor

        // Tweaks and Utilities
        +Mod.appleskin              // Displays hunger and saturation info
        +Mod.anvilPatchLawful       // Remove increase in enchantment / repair cost
        +Mod.artisanWorktables      // Custom crafting tables, can use tools and fluids
        +Mod.artisanAutomation      // Automation for Artisan Worktables
        +Mod.crafttweaker           // Add, change and remove recipes
            +Mod.dropt              // - Add and modify block drops
            +Mod.loottweaker        // - Changing of loot tables
            +Mod.modtweaker         // - Change more mod-related recipes
            +Mod.inworldcrafting    // - Add in-world recipes (fluid, burn, explode)
        +Mod.dynamicSurroundings    // Improve visual and audible experience
        +Mod.foamfixOptimizationMod // Optimizations for cutting down RAM usage
        +Mod.itemphysic             // Custom pickup, floating, burning tweaks, ...
        +Mod.jei                    // Look up recipes and uses of items
        +Mod.multiMine              // Save mining progress, mine with other players
        +Mod.passableLeaves         // Pass through leaves
        // +Mod.respawnablePets     // TODO: ?

        // Content
        +Mod.antiqueAtlas         // Craftable atlas with waypoints
        +Mod.charsetBlockCarrying // Pick up blocks and carry them around
        +Mod.charsetImmersion     // Stack ingots, plates and gears in-world
        +Mod.chiselsBits          // Build custom sub-block decorations
        +Mod.fairyLights          // Adds adorable looking hanging lights
        +Mod.pyrotech             // Primitive tools and devices with zero GUIs
        +Mod.quark                // Tons of Vanilla-style tweaks and additions
        +Mod.quarkOddities        // Matrix enchanting and Totem of Holding
        +Mod.wearableBackpacks    // Backpacks!
        // Technology
        +Mod.bwmSuite                   // Gameplay changes, mechanical power, ...
            +Mod.betterWithEngineering  // - Integration with Immersive Engineering
        +Mod.immersiveEngineering       // Electrical power, machines, ...
            +Mod.cratesFeltBlu          // - Storage Crates drop contents when broken
            +Mod.engineersDoors         // - Treated Wood and Steel doors and trapdoors
            +Mod.immersivePetroleum     // - Oil extraction and processing
        +Mod.opencomputers              // Modular computers programmable with Lua
            +Mod.charsetAudio           // - Audio storage and cables
            +Mod.openlights             // - Lights with controllable color
            +Mod.openprinter            // - Printing pages, Folders, File Cabinets
            +Mod.openscreens            // - Flatscreens and holographic screens
            // Computronics (see below) // - Additional computer components
        +Mod.simplelogicGates           // Various redstone gates
        +Mod.simplelogicWires           // Redstone wires (normal, insulated, bundled)
        // Magic
        +Mod.enderStorage18                  // Shared storage even between dimensions
        +Mod.thaumcraft                      // So much Magic!
            +Mod.expandedArcanum             // - Thaumcraft Drill heads, IE native clusters
            +Mod.engineeredGolems            // - Golems from Treated Wood and Steel
            +Mod.thaumcraftInventoryScanning // - Easily scan items from inventory screens
            +Mod.thaumicAugmentation         // - More magic and doors
        +Mod.psi                             // Programmable magic guns

        withTypeClass(Direct::class) {  }.list {
            +"computronics" { url = "http://files.vexatos.com/Computronics/Computronics-1.12.2-1.6.6.jar" }
        }

        withTypeClass(Local::class) {  }.list {
            +"hardcoreBytesMod" { fileSrc = "HardcoreBytesMod-1.12.2-0.1.0-SNAPSHOT+0a72038.jar" }
        }

        // SERVER RECOMMENDED MODS
        group {
            side = Side.SERVER
            optional { selected = true }
        }.list {
            +Mod.btfuContinuousRsyncIncrementalBackup { name = "BTFU"; description = "Best backup mod in existence! (setup required)" }
        }

        // CLIENT MODS
        group {
            side = Side.CLIENT
        }.list {
            // CLIENT REQUIRED MODS
            +Mod.blockDropsJeiAddon
            +Mod.justEnoughResourcesJer
            +Mod.thaumicJei

            // CLIENT RECOMMENDED MODS
            group {
                optional { selected = true }
            }.list {
                +Mod.betterPlacement { description = "Don't skip blocks when holding down mouse button to place" }
                +Mod.blur            { description = "When a GUI is open, fade out the world in the background" }
                +Mod.itemScroller    { description = "Use scroll wheel and other shortcuts to move items" }
                +Mod.soundFilters    { description = "Adds reverb in caves and mutes sounds that are occluded" }
            }

            // CLIENT OPTIONAL MODS
            group {
                optional { selected = false }
            }.list {
                +Mod.betterFoliage   { description = "Prettier vegetation, such as leaves and grass, at some FPS cost" }
                +Mod.mumblelink      { description = "Links Minecraft to Mumble, enabling positional audio" }
                // This should be `+Mod.probe` but CurseForge's API does not expose mods with only alpha releases.
                +(ProjectID(312683)) { description = "[MODPACK DEVELOPMENT] Dumps information to use with ZenScript VSCode extension" }
            }
        }
    }
}
