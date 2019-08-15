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
        +Mod.applecore
        +Mod.baubles
        +Mod.mcmultipart

        // World Generation
        +Mod.biomesOPlenty
        +Mod.geolosys
        +Mod.dynamictrees
            +Mod.dtbop // Biomes O' Plenty compatibility.
            +Mod.dttc  // Thaumcraft compatibility.

        // Content
        +Mod.antiqueAtlas
        +Mod.cofhCore // For potions and enchantments.
        +Mod.charsetAudio
        +Mod.charsetBlockCarrying
        +Mod.charsetImmersion
        +Mod.chiselsBits
        +Mod.quark
        +Mod.quarkOddities
        +Mod.wearableBackpacks
        // Technology
        +Mod.bwmSuite
            +Mod.betterWithEngineering
        +Mod.immersiveEngineering
            +Mod.cratesFeltBlu      // Storage Crates drop contents when broken.
            +Mod.engineersDoors     // Treated Wood and Steel doors and trapdoors.
            +Mod.immersivePetroleum // Oil extraction and processing.
        +Mod.opencomputers
            +Mod.openlights  // Lights with controllable color.
            +Mod.openprinter // Printing pages, Folders, File Cabinets.
            +Mod.openscreens // Flatscreens and holographic screens.
            // Computronics - see below.
        +Mod.retrocomputers
        +Mod.simplelogicGates
        +Mod.simplelogicWires
        // Magic
        +Mod.enderStorage18
        +Mod.thaumcraft
            +Mod.expandedArcanum  // Thaumcraft Drill heads, IE native clusters.
            +Mod.engineeredGolems // Golems from Treated Wood and Steel.
            +Mod.thaumcraftInventoryScanning
            +Mod.thaumicAugmentation
        +Mod.psi

        // Tweakings
        +Mod.appleskin
        +Mod.artisanWorktables
        +Mod.crafttweaker
            +Mod.contenttweaker
            +Mod.loottweaker
            +Mod.modtweaker
            +Mod.inworldcrafting
        +Mod.jei
        +Mod.passableLeaves

        withProvider(DirectProvider).list {
            +"computronics" configure {
                url      = "http://files.vexatos.com/Computronics/Computronics-1.12.2-1.6.6.jar"
                fileName = "Computronics-1.12.2-1.6.6.jar"
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
                    { description = "Use scroll wheen and other shortcuts to move items" }
            }

            // CLIENT OPTIONAL MODS
            group {
                optional {
                    selected = false
                }
            }.list {  }
        }
    }
}
