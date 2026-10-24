# Agent-first quickstart

## Choose the right installation path

**Play a packaged adventure:** extract the whole ZIP, use Node.js 20+ and `cli.cjs`. No npm install, API key, account, display, browser, network, or server is needed. The Ink runtime is vendored. Invoke the CLI by absolute path if your working directory differs.

**Author, build, or run the complete developer suite:** use Node.js 24.15+ (24 LTS recommended) and run `npm ci --ignore-scripts`. The simulated-browser test dependency needs a newer Node than the runtime. Dependencies are pinned by package-lock.json; installation needs registry access. After installation, tests and compilation work offline. Do not assume Node 20 can run the developer suite.

## Discover before acting

```sh
node cli.cjs help
node cli.cjs version
node cli.cjs catalog
node cli.cjs premades
node cli.cjs validate adventures/default.ctrpg
node cli.cjs start - journey.json
node cli.cjs show journey.json
node cli.cjs choose journey.json hear_petition
```

`start` requires a new filename and never overwrites a prior run. `-` selects the Cleric; otherwise supply character JSON. To use another adventure, append the same `.ctrpg` path to start, show, and choose. Save files identify the adventure ID/version, but do not contain its full story.

## Agent loop

1. Parse stdout as JSON. Read `text`, `state`, and `choices`.
2. If `ended` is true, stop. An ending can be victory or defeat; read the narrative and journal.
3. Select an exact ID from the current `choices` array. Never invent action IDs or reuse stale options.
4. Call `choose`, then parse the new view. The save has already been persisted on successful return.
5. Retain the save, matching adventure package, engine version, and character export for transfer.

Use `node examples/agent-play.cjs` for a complete autonomous demo loop. It makes the first offered legal choice, not an intelligent tactical decision. The step limit is a safety guard, not a victory guarantee. A real agent should interpret consequences and choose for the player's goals.

## Process contract

- Successful commands output one JSON value to stdout, never ANSI control codes or progress text.
- `start` also prints one introductory notice to stderr. Do not interpret nonempty stderr alone as failure.
- Exit 0: success. Exit 1: validation, data, persistence, or runtime error. Exit 2: CLI usage error.
- On ordinary command errors stderr contains JSON `{ "error": { "code": "...", "message": "..." } }`, stdout is empty.
- `validate` is special: an invalid adventure emits its structured validation report on stdout and exits 1.
- `show` is read-only. Failed `choose` does not replace the save. If an external interruption occurs, inspect the save before retrying; blindly repeating an action may spend another charge.
- Writes use a temporary file and rename; startup uses exclusive creation. This is not a database or a multiwriter protocol. One agent/process owns a save at a time. Clone saves into distinct files for experiments.
- Inputs are limited to 5 MiB at the CLI boundary. JSON files should be UTF-8.
- Common error codes include USAGE, SAVE_EXISTS, INPUT_TOO_LARGE, INVALID_ADVENTURE, INVALID_INPUT, and OS codes such as ENOENT/EACCES. Read the message as well; not all engine failures have individually stable codes yet.

## Character customization

Export a premade, change its name, ancestry, background, appearance, and catalog choices within its profile limits, then run `validate-character`. The catalog command is the authoritative list. Assign the fixed modifier array exactly once across six abilities. Proficiencies and spells must be unique catalog IDs/names; arbitrary prose grants no mechanical features. Profile HP and charges are derived, not user-entered. Appearance is a versioned recipe, not a URL or image upload.

## Deterministic QA versus honest play

The JS API accepts `{testSeed: integer}` only for marked test sessions. Such sessions cannot be saved as regular gameplay. Normal CLI play uses secure randomness; no seed flag or result-overriding command is offered. Tests may inspect internal state, but agents playing a user's adventure should only choose offered actions, not directly call internal methods or edit the save to force outcomes.

## What the API does not promise

This is not an unrestricted tabletop simulation. Actions, spells, targets, checks, and branches are authored. No free-text action parser, initiative scheduler, levels, inventory simulation, spell-slot tiers, concurrent campaigns server, or network service exists. Any valid character can enter any valid adventure, but its abilities may not all have authored opportunities; review `supportedAbilities` first.
