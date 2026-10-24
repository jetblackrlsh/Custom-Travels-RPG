---
name: create-custom-travels-adventure
description: Author, test and package original Custom Travels RPG adventures for offline browser and headless play, with portable characters, transparent dice and scene-matched generic artwork.
---

# Create a Custom Travels adventure

Use the repository containing this skill. Read README.md, AGENTS.md, docs/AUTHORING.md, docs/HEADLESS.md, docs/AGENT-QUICKSTART.md, docs/SECURITY.md, docs/PLAYER-GUIDE.md and docs/SLIME-QUEEN.md. Discover the actual catalog and CLI before inventing commands or fields. Developer tooling requires Node 24.15+; packaged headless play uses Node 20+ without npm or a server.

## Bound the design
Keep one shared browser/headless engine, the fixed array, profile allowances, portable appearance recipes, finite shared charges and honest dice. No levels, XP, arbitrary text powers or hidden outcome overrides. Test-seeded sessions are for QA and cannot be exported as normal play.

Write a fresh beat outline, not a previous example with renamed objects. Mandatory obstacles need ordinary or no-charge alternatives. Every valid engine character can enter, but not every build must win. Provide genuine failures, retreat or defeat, and meaningful allegiance consequences.

Prefer reachable opportunities for all nine current abilities: Guiding Bolt, Shocking Grasp, Shield of Faith, Magic Missile, Command, Sleep, Comprehend Languages, Giant and Illusory Duplicate. Authors may intentionally support a subset; declare supportedAbilities truthfully. An unreachable action or mention in prose is not support. Never require a player's class label when the actual capability/proficiency is what matters.

Specify the roll, ability, proficiency, target DC/AC and both outcomes. Distinguish fixed from rolled damage. State charge costs, including failed casts. Boons remain finite adventure state and must not modify exported character limits. Use once-only grants and no unlimited recovery loops. Enemy spell phases need explicit limits and readable counterplay.

## Implement
Use the existing manifest schema, compile.cjs, validator and src/engine.js. Do not write a substitute interpreter. Keep original story and generic assets; do not include proprietary reference-game code/art or private user character sheets.

Create a visual ledger: location, present actors, condition, props, ownership and action consequences. Use exact asset IDs. Player weapons must match the full weapon catalog and be hidden during unrelated gestures. Do not show healthy defeated enemies, invented bystanders or premature outcome spoilers. Extend generic artwork when a needed subject is missing. Inspect rendered frames, not just IDs or counts.

## Verify
Run the full npm test and npm run build against final code. Add adventure-specific tests for all scenes/actions, each rolled check's success and failure, all endings, five premades, diverse custom builds, zero-charge paths, charge consumption, bounded effects, boons, save/restore and cross-adventure character transfer. Test both import orders: character then adventure, and adventure then character. Invalid imports must leave valid state intact.

Measure difficulty using declared policies and multiple builds. Report sample size, seeds, win rates, remaining HP and charges spent. Distinguish random stress tests, fixed tactics and human playtests. Do not force an injury or victory to match a target. Investigate impossible routes and disproportionate instant wins without flattening legitimate strengths.

Run UI tests for duplicate clicks, interrupted resolution, restart, imports, unsafe text and reduced motion. Simulated DOM is not live-browser/file:// or WebGL verification; disclose any unavailable surface. Review visual state changes separately.

## Package
Use package.cjs into a fresh directory. Verify a clean extracted ZIP contains START.html, local runtime and asset paths, source, docs, attribution and LICENSE. No network, npm install or server may be required for normal browser play. Include the .ctrpg and source manifest so the adventure can be imported into another compatible engine. Saves require the matching adventure ID/version; character files are portable.

Retain GPL-3.0-only requirements for the engine and original bundled work, MIT notices for InkJS and CC BY 4.0 attribution for SRD-derived material. Do not add noncommercial restrictions. Publication or uploading requires the user's authorization; preparing an adventure is not blanket publishing permission.
