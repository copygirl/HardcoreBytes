# Hardcore Bytes

This [Minecraft] 1.12.2 modpack project aims to create an experience focused on hardcore progression and exploration, making *[OpenComputers]* its end goal and teaching it and the other mods on the way.

You will struggle with wildy unfamiliar crafting recipes and mechanics, explore abandoned facilities, eventually building an automated base powered by computers with programs you either coded yourself or scavenged from around the world.

## Other notable Mods

- *[Geolosys]:* For overhauled ore generation. Much rarer and larger veins.
- *[Biomes O' Plenty]:* Provides additional biomes for a more diverse world.
- *[Better With Mods]:* Offers early-game mechanical power.
- *[Immersive Engineering]:* Bridges mechanical and electrical power.
- *[RetroComputers]:* Low-tier alternative to *OpenComputers*.
- *[Thaumcraft]:* Extra flavor and a way to craft "magical" components.
- *[Psi]:* Programmable spells, unlocked with late-game magic and technology.

## Download

*Hardcore Bytes* uses the modpack development tool [Voodoo] and since it's still under heavy development, we use its pack deployment functionality. As such, there is a `.zip` file that can be imported as an instance into [MultiMC]. The instance will automatically be kept up-to-date whenever you launch it.

- Download [MultiMC] if you don't have it already, then start it
- Click "Add Instance", then "Import from zip"
- Paste the URL `https://meowface.org/copygirl/HardcoreBytes.zip`
- Click "OK", then launch your new *Hardcore Bytes* instance
- If you get a "Pre-Launch command failed with code 0." error, just re-launch
- Select the optional mods you want to play with
- Wait for all the mods to download, then get ready to rumble!

## Development

We also use [Voodoo] for easy mod version management, updating to the latest version of mods on CurseForge, and creating the self-updating MultiMC instance seen above.

Make sure to clone and build the companion mod [Hardcore Bytes Mod] and place it in the `local/` folder. You may need to update the mod's entry in `packs/hardcorebytes.voodoo.kts` if the commit hash doesn't match, or build the specific commit in case you wish to build an older version of the modpack.

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
[Hardcore Bytes Mod]:    https://github.com/copygirl/HardcoreBytesMod
