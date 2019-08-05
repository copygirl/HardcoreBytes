@file:GenerateForge(name="Forge", mc="1.12.2")
@file:GenerateMods(name="Mod", mc="1.12.2")
@file:GenerateMods(name="Mod", mc="1.12.1")
@file:GenerateMods(name="Mod", mc="1.12")

title     = "Hardcore Bytes"
authors   = listOf("copygirl")
version   = "0.0.1"
mcVersion = "1.12.2"
icon      = rootDir.resolve("icon.png")
forge     = 1.12.2-recommended

pack {
    skcraft {
        userFiles = UserFiles(
            include = listOf(
                "options.txt",
                "quark.cfg"
            ),
            exclude = listOf()
        )
    }
}

root(voodoo.provider.CurseProvider) {
    validMcVersions = setOf("1.12.2", "1.12.1", "1.12")
    releaseTypes    = setOf(FileType.RELEASE, FileType.BETA)

    // COMMON MODS
    list {
        // Libraries
        +Mod.appleskin
        +Mod.autoreglib
        +Mod.baubles
        +Mod.cofhcore

        // World Generation
        +Mod.biomesOPlenty
        +Mod.cofhworld
        +Mod.geolosys
        +Mod.dynamictrees
        +Mod.dtbop // DynamicTrees Biomes O' Plenty compat
        +Mod.dttc  // DynamicTrees Thaumcraft compat

        // Content
        +Mod.antiqueAtlas
        +Mod.thermalFoundation
        +Mod.quark
        +Mod.quarkOddities
        +Mod.wearableBackpacks
        // Technology
        +Mod.bwmSuite
        +Mod.betterWithEngineering
        +Mod.immersiveEngineering
        +Mod.opencomputers
        // Magic
        +Mod.enderStorage18
        +Mod.thaumcraft
        +Mod.psi

        // Tweakings
        +Mod.artisanWorktables
        +Mod.crafttweaker
        +Mod.jei
    }

    // SERVER RECOMMENDED MODS
    group {
        side = Side.SERVER
        optional {
            selected = true
            skRecommendation = Recommendation.starred
        }
    }.list {
        +Mod.btfuContinuousRsyncIncrementalBackup
        +Mod.morpheus
    }

    // CLIENT MODS
    group {
        side = Side.CLIENT
    }.list {
        // CLIENT REQUIRED MODS


        // CLIENT RECOMMENDED MODS
        group {
            optional {
                selected = true
                skRecommendation = Recommendation.starred
            }
        }.list {
            +Mod.betterPlacement
            +Mod.itemScroller
        }

        // CLIENT OPTIONAL MODS
        group {
            optional {
                selected = false
            }
        }.list {

        }
    }
}
