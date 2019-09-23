# Hardcore Bytes

This [Minecraft] 1.12.2 modpack project aims to create an experience focused on hardcore progression and exploration, making *[OpenComputers]* its end goal and teaching it and the other mods on the way.

You will struggle with wildy unfamiliar crafting recipes and mechanics, explore abandoned facilities, eventually building an automated base powered by computers with programs you either coded yourself or scavenged from around the world.

## Other notable Mods

- *[Geolosys]*: For overhauled ore generation. Much rarer and larger veins.
- *[Biomes O' Plenty]*: Provides additional biomes for a more diverse world.
- *[Better With Mods]*: Offers early-game mechanical power.
- *[Immersive Engineering]*: Bridges mechanical and electrical power.
- *[RetroComputers]*: Low-tier alternative to *OpenComputers*.
- *[Thaumcraft]*: Extra flavor and a way to craft "magical" components.
- *[Psi]*: Programmable spells, unlocked with late-game magic and technology.

## Development

*Hardcore Bytes* uses [Voodoo] for easy mod version management, downloading the latest version of mods directly from CurseForge, providing self-updating [MultiMC] instances and much more.

```bash
# Apply mod changes in pack and update mods to latest:
./gradlew hardcorebytes_build
# Test in MultiMC, creating an instance if necessary:
./gradlew hardcorebytes_test_mmc
```


[Minecraft]: https://minecraft.net/
[MultiMC]:   https://multimc.org/
[Voodoo]:    https://github.com/DaemonicLabs/Voodoo

[OpenComputers]:         https://www.curseforge.com/minecraft/mc-mods/opencomputers
[Geolosys]:              https://www.curseforge.com/minecraft/mc-mods/geolosys
[Biomes O' Plenty]:      https://www.curseforge.com/minecraft/mc-mods/biomes-o-plenty
[Better With Mods]:      https://www.curseforge.com/minecraft/mc-mods/bwm-suite
[Immersive Engineering]: https://www.curseforge.com/minecraft/mc-mods/immersive-engineering
[RetroComputers]:        https://www.curseforge.com/minecraft/mc-mods/retrocomputers
[Thaumcraft]:            https://www.curseforge.com/minecraft/mc-mods/thaumcraft
[Psi]:                   https://www.curseforge.com/minecraft/mc-mods/psi
