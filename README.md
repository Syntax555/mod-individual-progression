## Portable assembly integration

This **Individual Progression** fork is maintained for
[AzerothCore Playerbots Portable](https://github.com/Syntax555/mod-playerbots-portable/blob/main/README.md). Its original upstream is
[ZhengPeiRu21/mod-individual-progression](https://github.com/ZhengPeiRu21/mod-individual-progression), imported at
[`4933d455d2f6`](https://github.com/ZhengPeiRu21/mod-individual-progression/commit/4933d455d2f611eed50c74c68c78832df4ed37a3).
The assembly pins a tested commit of this fork's `master` branch in
[`versions.lock.json`](https://github.com/Syntax555/mod-playerbots-portable/blob/main/versions.lock.json), together with its matching core and modules.

Use the assembly's [installation and build instructions](https://github.com/Syntax555/mod-playerbots-portable/blob/main/README.md),
[module catalog](https://github.com/Syntax555/mod-playerbots-portable/blob/main/docs/module-versions.md#server-modules) and
[Character progression](https://github.com/Syntax555/mod-playerbots-portable/blob/main/docs/changing-expansions.md). Before contributing, read its
[repository rules](https://github.com/Syntax555/mod-playerbots-portable/blob/main/AGENTS.md) and [fork workflow](https://github.com/Syntax555/mod-playerbots-portable/blob/main/CONTRIBUTING.md#changing-the-server).
The **Portable integration** workflow checks this fork's current commit against
the assembly's pinned dependencies with the relevant production fixtures.

---


# Individual Player Progression

## Azerothcore Module

This module simulates progress through expansions and expansion tiers for individual players.

Each tier is designed to simulate the experience of being within that tier and expansion, within the limitations of the WotLK client. This means Vanilla content is like it was during Vanilla WoW.

The goal of the module is to focus on the journey of the player. All catch-up mechanics have been removed. There is no goal to rush to end-game or find a "fresh" server, because each new character is a fresh experience.

Note that this module either requires many players working together, or adjustments for smaller raid size to allow individual groups to progress. This module works well together with Playerbots and NPCbots.

Lower-level content added in later expansions that is not "catch-up" content has NOT been removed. This includes Draenei and Blood Elf starting zones, Inscription and Jewelcrafting skills, new quests and hubs added to the Vanilla world in TBC, and so on. I feel this content does not negatively impact the player journey like "catch-up" content. Some of this content can optionally be phased until the appropriate patch in which it was introduced for those who prefer an even more authentic Vanilla world - see the optional SQL files for more details.

## Some Included Features
* NPCs and Game Objects are aware of individual player progress, visible depending on player progression
* Restoration of content that was removed, nerfed or released in a later patch. Such as the original Naxxramas, Onyxia and TBC Attunement quests, elite creatures in outdoor areas and riding skills.
* Overhaul of vanilla creatures and quests. (Smart AI, quest drop chances, creature respawn times, patrols and spawn locations have all been restored.)
* Optional power and healing adjustment for Vanilla and TBC content to simulate the original world difficulty.
* WotLK emblems drop based on your progression.
* Original vanilla AV
* Isle of Quel'Danas Progression
* Playerbots support

Here you can find a list of all the [changes](https://github.com/ZhengPeiRu21/mod-individual-progression/wiki/List-of-Changes) and [progression tiers](https://github.com/ZhengPeiRu21/mod-individual-progression/wiki/List-of-Progression-Tiers).

Options are provided that allow changes to the player experience, based on preference. Please see the config file.

## How to Install
Please see [How to Install](https://github.com/ZhengPeiRu21/mod-individual-progression/wiki/How-to-Install)

## Please Note!
This module uses Player Settings to save individual character progress. *Please ensure that EnablePlayerSettings is set to 1 in worldserver.conf or progress will not be saved!* Also, for item changes to take effect, please ensure *DBC.EnforceItemAttributes is set to 0*! This will allow the module to override item stats with their correct Vanilla stats.

### Optional Data Files
Some changes for Vanilla and TBC content require DBC modification. The .mpq file for the client and .dbc files for the server can be found in the "optional" directory. These changes include requiring Vanilla reagents such as Flint and Steel for campfires, changing Level 60 enchanting to use Vanilla and not TBC reagents, profession leveling adjustments, etc. These files are all optional and the module will work without the patch, but these recipes will remain their WotLK versions.

### Optional Recommended Addon
For a more authentic experience, some players may prefer to have pre-3.2 behavior of item prices only being displayed in tooltips when at a vendor. 
This is handled by the client, so I have created an addon that will restore this behavior. The addon can be found here: https://github.com/ZhengPeiRu21/hide-vendor-price

## Discord
[https://discord.gg/PTXxh3KSgQ](https://discord.gg/PTXxh3KSgQ)

## Thank You
Special thanks to the following contributors and projects that made this module possible:
* AzerothCore and TrinityCore, along with ancestors Mangos.
* AzerothCore mod-war-effort
* AzerothCore mod-pvp-titles
* vMangos for Vanilla game and patch progression data
* cMangos for TBC game data
* Sogladev for Naxx 40 scripts and data
