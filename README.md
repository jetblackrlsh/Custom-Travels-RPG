# Custom Travels RPG

An illustrated, SRD-inspired solo gamebook engine. Bring the same custom traveler into different authored adventures, play with honest dice, and see exactly how each check works.

## Play offline

1. Extract the complete ZIP. Do not run inside the ZIP viewer.
2. Open **START.html** in a modern browser. No server, account, installation, or network connection is required by the package.
3. Choose a premade or build your traveler, review adventure ability coverage, and begin.
4. Use **Export character** and **Export save** to transfer to another computer. Browser storage is only a convenience.

This is the **0.2.1 open-source alpha**. Select either included adventure on the welcome screen. See docs/TEST-REPORT.md for tested behavior and remaining live-browser/cross-platform verification limits.

## Included

- Five editable premades: Cleric, Fighter, Paladin, Rogue, Wizard.
- Four build profiles, one rearrangeable ability array, a proficiency catalog, nine abilities, and shared spell charges.
- Full-puppet appearance recipes from 2D Cartoon Studio, reconstructed locally for portraits and scenes.
- The Last Pulse of Heaven: a 19-scene medieval science-fantasy adventure with 47 actions, two allegiances, four ending variants, and all nine ability opportunities. The earlier lantern adventure remains only as a regression fixture.
- An Ink/inkjs story runtime with one shared rules implementation for browser and headless use.
- Standalone character/save exports, adventure-pack import, readable journal, and reduced-motion option.
- A JSON-to-Ink compiler, validator, headless CLI, tests, and companion skill.

## Headless, without a server

Node.js 20+ is needed only for this command-line route. Normal browser play does not need Node.

```sh
node cli.cjs premades
node cli.cjs start - journey.json
node cli.cjs show journey.json
node cli.cjs choose journey.json hear_petition
```

`-` selects the Cleric for the example. Supply an exported character JSON instead to use your own traveler. Commands emit JSON. See docs/HEADLESS.md.

## Author an adventure

Using Node.js 24.15+ for developer tooling, run `npm ci --ignore-scripts` once on the authoring machine, then:

```sh
node compile.cjs adventures/dragon.manifest.json my-adventure.ctrpg
node cli.cjs validate my-adventure.ctrpg
npm test
```

Import the `.ctrpg` pack through the browser's Import file button. For a standalone ZIP, use `node package.cjs my-adventure.ctrpg output-directory`, then ZIP that output directory. The built game needs no npm, compiler, or server.

Read docs/AUTHORING.md before writing. For adventures authored for Jet, provide reachable opportunities for **all nine** abilities and meaningful nonmagical alternatives. Other authors may declare a subset, shown before play.

## License and distribution

Original engine code, generic Studio-derived artwork, and included original adventures are licensed GPL-3.0-only. See LICENSE. Commercial use and modification are permitted under its terms. InkJS remains MIT, and SRD-derived material retains CC BY 4.0 attribution in docs/CREDITS.md. No proprietary reference-game story, code, or artwork is included.

## New adventure: The Slime Queen’s Offer

Investigate living slime, climb a mountain by several routes, solve a two-presence gate, and choose whether to oppose the queen or join her against the Heroes Guild. Giant and Illusory Duplicate are reusable catalog abilities. The queen’s optional two-charge gift is adventure state, not permanent character progression. Both sides are playable without spells; survival is not guaranteed.

Select the adventure on the welcome screen or pass adventures/slime.ctrpg to the CLI. Three portable example characters are in examples/characters/. See docs/SLIME-QUEEN.md for mechanics, spoilers, and visual staging.

## Agent contributors

Start with [AGENT-QUICKSTART](docs/AGENT-QUICKSTART.md), [HEADLESS](docs/HEADLESS.md), [SECURITY](docs/SECURITY.md), and [AGENTS.md](AGENTS.md). Run `node cli.cjs help` for machine-readable discovery. The included CI workflow targets Linux, Windows, and macOS, but is not evidence those platforms were tested.

The 0.1.3 visual pass is documented in docs/VISUAL-STAGING.md. It leaves the adventure mechanics and content unchanged.

### 0.1.4 visual update
All 37 starting weapons have explicit, distinct original SVG artwork and weapon-family attack poses. No unknown selection silently becomes a sword. Weapons are displayed for relevant weapon attacks, not during unrelated dialogue or spell gestures. Existing version-1 characters and saves remain compatible; combat arithmetic is unchanged.

## 0.2.1: Delayed Charged Strike
Prepare for one turn, taking the enemy response, then gain +4 fixed bonus damage on your next weapon hit in that encounter. A miss spends the preparation; no stacking. The engine supplies it automatically alongside eligible weapon attacks, including in older imported adventures. See docs/CHARGED-STRIKE.md for rules and save compatibility. The release retains GPL-3.0-only and all existing third-party notices.

The updated companion skill requires multiple genuinely distinct nonmagical progression approaches for future adventures. Existing story obstacles have not been rewritten in this mechanics update.
