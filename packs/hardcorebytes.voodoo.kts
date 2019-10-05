@file:GenerateForge(name="Forge", mc="1.12.2")
@file:GenerateMods(name="Mod", mc="1.12.2")
@file:GenerateMods(name="Mod", mc="1.12.1")
@file:GenerateMods(name="Mod", mc="1.12")

title     = "Hardcore Bytes"
authors   = listOf("copygirl")
version   = "0.0.1"
mcVersion = "1.12.2"
icon      = rootDir.resolve("icon.png")
forge     = Forge.mc1_12_2_latest

pack {
    skcraft {
        userFiles = UserFiles(
            include = listOf("options.txt"),
            exclude = listOf()
        )
    }
}

root(voodoo.provider.CurseProvider) {
    validMcVersions = setOf("1.12.2", "1.12.1", "1.12")
    releaseTypes    = setOf(FileType.Release, FileType.Beta)

    // COMMON MODS
    list {
        // Libraries
        +Mod.applecore   // Food related library, required for BWM's HCHunger
        +Mod.baubles     // Adds 7 more equipment slots for items
        +Mod.mcmultipart // Allows certain blocks to fit in a single block space

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
        +Mod.appleskin           // Displays hunger and saturation info
        +Mod.anvilPatchLawful    // Remove increase in enchantment / repair cost
        +Mod.artisanWorktables   // Custom crafting tables, can use tools and fluids
        +Mod.crafttweaker        // Add, change and remove recipes
            +Mod.dropt           // - Add and modify block drops
            +Mod.loottweaker     // - Changing of loot tables
            +Mod.modtweaker      // - Change more mod-related recipes
            +Mod.inworldcrafting // - Add in-world recipes (fluid, burn, explode)
        +Mod.foamfixForMinecraft // Optimizations for cutting down RAM usage
        +Mod.itemphysic          // Custom pickup, floating, burning tweaks, ...
        +Mod.jei                 // Look up recipes and uses of items
        +Mod.multiMine           // Save mining progress, mine with other players
        +Mod.passableLeaves      // Pass through leaves

        // Content
        +Mod.antiqueAtlas         // Craftable atlas with waypoints
        +Mod.cofhCore             // More potions and enchantments
        +Mod.charsetBlockCarrying // Pick up blocks and carry them around
        +Mod.charsetImmersion     // Stack ingots, plates and gears in-world
        +Mod.chiselsBits          // Build custom sub-block decorations
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
        +Mod.retrocomputers             // Simpler computers programmable with Forth
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

        withProvider(DirectProvider).list {
            +"computronics" configure {
                url      = "http://files.vexatos.com/Computronics/Computronics-1.12.2-1.6.6.jar"
                fileName = "Computronics-1.12.2-1.6.6.jar"
            }
        }

        withProvider(LocalProvider).list {
            +"HardcoreBytesMod" configure {
                fileSrc = "HardcoreBytesMod-1.12.2-0.1.0-SNAPSHOT.jar"
            }
        }

        // SERVER RECOMMENDED MODS
        group {
            side = Side.SERVER
            optional {
                selected = true
                skRecommendation = Recommendation.starred
            }
        }.list {
            +Mod.btfuContinuousRsyncIncrementalBackup configure
                { description = "Best backup mod in existance! (setup required)" }
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
                optional {
                    selected = true
                    skRecommendation = Recommendation.starred
                }
            }.list {
                +Mod.betterPlacement configure
                    { description = "Don't skip blocks when holding down mouse button to place" }
                +Mod.blur configure
                    { description = "When a GUI is open, fade out the world in the background" }
                +Mod.itemScroller configure
                    { description = "Use scroll wheel and other shortcuts to move items" }
            }

            // CLIENT OPTIONAL MODS
            group {
                optional {
                    selected = false
                }
            }.list {
                +Mod.betterFoliage configure
                    { description = "Prettier vegetation, such as leaves and grass, at some FPS cost" }
            }
        }
    }
}
