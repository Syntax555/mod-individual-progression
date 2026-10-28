# Individual Progression — portable integration

This fork supplies character-specific content milestones for
[AzerothCore Playerbots Portable](https://github.com/Syntax555/mod-playerbots-portable).
Players and bots earn Vanilla, TBC and Wrath access through their own progress;
level, account membership and party leaders do not supply another character's
unlock. Selected quests, creatures, items, experience and PvP rules follow that
progress within the Wrath core and client.

## Install or build

For normal use, download the Windows server and matching EraTalents client pack
from the assembly's [Latest release](https://github.com/Syntax555/mod-playerbots-portable/releases/latest)
and follow its [quick start](https://github.com/Syntax555/mod-playerbots-portable#quick-start).
The matching client pack is required for this assembly; do not substitute the
upstream optional patch or use it alongside the generated pack.

For source builds, follow the assembly's
[build guide](https://github.com/Syntax555/mod-playerbots-portable/blob/main/docs/building.md).
Its [versions.lock.json](https://github.com/Syntax555/mod-playerbots-portable/blob/main/versions.lock.json)
selects the exact core and all matching module commits. This fork develops on
`master`; use the locked commits to reproduce a release. The complete native
build runs in the assembly.

## Behavior and configuration

The portable profile enables strict earned progression and applies the same
milestones to random bots and ordinary players. Boss credit requires the
character's presence; skipped tiers, account exemptions, leader copying and
group attunement-item grants are disabled in this mode. SelfBots and controlled
altbots retain human character rights and manual talent choices.

Edit `configs/modules/individualProgression.conf` with the realm stopped.
The assembly enables `IndividualProgression.StrictEarnedProgression`, leaves
`IndividualProgression.BotAccountsRegex` and `IndividualProgression.ExcludedAccountsRegex`
empty, and sets `EnablePlayerSettings = 1` and `DBC.EnforceItemAttributes = 0`
in `configs/worldserver.conf`. The module's
[configuration template](conf/individualProgression.conf.dist) has different
standalone defaults; cloning it alone does not install the portable profile.
See [character progression and realm ceilings](https://github.com/Syntax555/mod-playerbots-portable/blob/main/docs/changing-expansions.md)
for milestone tiers, optional realm modes and preserving existing realms.

The server and client remain Wrath-based. Historical changes cover selected
systems rather than an exact original Vanilla/TBC simulation; historical TBC
talents use TBC Classic data. Existing characters, inventories and gold are
preserved without checking their origin. Full quest, class and encounter
coverage remains subject to [gameplay validation](https://github.com/Syntax555/mod-playerbots-portable/blob/main/docs/todo.md).
Use [quest diagnostics](https://github.com/Syntax555/mod-playerbots-portable/blob/main/docs/quest-diagnostics.md)
to report a blocked quest or milestone.

## Development and provenance

Read [AGENTS.md](AGENTS.md) and the assembly's
[contributing guide](https://github.com/Syntax555/mod-playerbots-portable/blob/main/CONTRIBUTING.md).
Make validated changes on `master`, then update the assembly pin. Preserve
progression guards, characters, databases, configuration and pinned history.

Imported from [ZhengPeiRu21/mod-individual-progression at `4933d455d2f6`](https://github.com/ZhengPeiRu21/mod-individual-progression/commit/4933d455d2f611eed50c74c68c78832df4ed37a3).
The [original README](https://github.com/ZhengPeiRu21/mod-individual-progression/blob/4933d455d2f611eed50c74c68c78832df4ed37a3/README.md)
and [upstream wiki](https://github.com/ZhengPeiRu21/mod-individual-progression/wiki)
remain general references; use the assembly guides for its installed policy.

Credits include ZhengPeiRu21 and contributors, AzerothCore, TrinityCore,
MaNGOS, mod-war-effort, mod-pvp-titles, vMangos, cMangos and Sogladev's Naxx 40
scripts and data. Preserve the repository's [MIT license](LICENSE), individual
AGPL source notices and all other upstream file licenses.
