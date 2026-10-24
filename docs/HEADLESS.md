# Headless API

Browser and headless use `Game` from `src/engine.js`.

```js
const {Game} = require('./src/engine');
const pack = JSON.parse(require('fs').readFileSync('adventures/default.ctrpg'));
const character = require('./src/catalog').premades[0];
const game = new Game(pack, character);
console.log(game.view());
game.choose('hear_petition');
const save = game.save();
const resumed = Game.restore(pack, save);
```

`view()` exposes narrative text, scene, choices with stable IDs, character, full current state, journal, ending flag, and test-mode marker. `choose(id)` rejects unavailable choices. No timers, animations, browser, display server, or network are required.

CLI commands:
- `premades`: emit all five character records.
- `start CHARACTER.json|- SAVE.json [ADVENTURE.ctrpg]`: start a fresh run; `-` uses the Cleric.
- `show SAVE.json [ADVENTURE.ctrpg]`: inspect without advancing.
- `choose SAVE.json ACTION_ID [ADVENTURE.ctrpg]`: choose and atomically replace the save file.
- `validate ADVENTURE.ctrpg`: structural report; nonzero exit on failure.

Randomness is system cryptographic randomness with rejection sampling for normal play. No generated outcome is silently changed to help a player or fit an ending. Deterministic test seeds are explicitly marked, use a separate test generator, and are not normal player sessions. Exported local files are editable by their owners; this is not an anti-cheat or competitive verification system.

## Stable entry points and compatibility

Use `Game`, `validateCharacter`, `view`, `choose`, `save`, and `Game.restore` as the main integration boundary. `act`, `hurt`, `check`, `random`, and mutable `state` are implementation/testing details, not a public command protocol. Calling them directly can bypass story routing. `secureDie` accepts integer sides 2–100. Normal gameplay save/character format version remains 1 through 0.1.2. Unknown future formats fail instead of being guessed. Reuse the exact matching adventure ID/version; edited content should increment the adventure version.

`view().choices` is the authoritative action list. `index` is transient; prefer `id`. View and save records are deep copies. The engine has no pending asynchronous work after a method returns. The CLI rehydrates state each invocation, which is simple but not optimized for thousands of real-time decisions. Embed the JS API for high-volume simulations.

The journal contains action ID/label/scene, charge cost, success/outcome, resulting HP/charges and, when relevant, check arithmetic, damage formula/dice, retaliation, enemy HP, and blocked damage. Read these fields rather than inferring mechanics from prose. No network telemetry is required by the game.

New discovery commands in 0.1.1: `help`, `version`, `catalog`, and `validate-character CHARACTER.json`. See AGENT-QUICKSTART.md for exit codes, errors, working-directory behavior, concurrency, and the runnable agent example.
