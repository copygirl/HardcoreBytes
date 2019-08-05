# Hardcore Bytes

This [Minecraft] (Java Edition) modpack project aims to create an experience
focused on hardcore progression and exploration, making *[OpenComputers]* its
end goal and teaching it and the other mods on the way.

You will struggle with wildy unfamiliar crafting recipes, explore abandoned
facilities, extracing resources and programs, eventually building an automated
base powered by computers.

## Other notable Mods

- *[Geolosys]* for overhauled ore generation. Much rarer and larger veins.
- *[Biomes O' Plenty]* provides additional biomes for a more diverse world.
- *[Better With Mods]* offers early-game mechanical power.
- *[Immersive Engineering]* bridges the gap between mechanics and electricity.
- *[RetroComputers]* are a low-tier alternative to *OpenComputers*.
- *[Thaumcraft]* adds extra flavor and a balanced way to craft magical devices.

## Development

*Hardcore Bytes* uses [Voodoo] for easy mod version management, downloading
the latest version of mods directly from CurseForge, providing self-updating
[MultiMC] instances and much more.

```bash
# Update mods in the pack to latest:
./gradlew hardcorebytes_build
# Test in MultiMC, creating an instance if necessary:
./gradlew hardcorebytes_test_mmc
```


[Minecraft]: https://minecraft.net/
[MultiMC]:   https://multimc.org/
[Voodoo]:    https://github.com/DaemonicLabs/Voodoo

[OpenComputers]:         https://www.curseforge.com/minecraft/mc-mods/opencomputers
[Geolosys]:              https://www.curseforge.com/minecraft/mc-mods/geolosys
[Biomes O' Plenty]:      https://www.curseforge.com/projects/biomes-o-plenty
[Better With Mods]:      https://www.curseforge.com/minecraft/mc-mods/bwm-suite
[Immersive Engineering]: https://www.curseforge.com/projects/immersive-engineering
[RetroComputers]:        https://www.curseforge.com/minecraft/mc-mods/retrocomputers
[Thaumcraft]:            https://www.curseforge.com/projects/thaumcraft
