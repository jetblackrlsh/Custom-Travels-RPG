# 0.2.0 alpha release

## What changed
- Added The Slime Queen’s Offer as an importable adventure and built-in welcome-screen selection. The Last Pulse of Heaven remains included.
- Added Giant and Illusory Duplicate to the shared catalog and bounded adventure boons to the shared engine.
- Added Zana Splode, Ingrid Large and Serena Split as optional portable example character JSON files, preserving the five original premades.
- Added explicit counterattack suppression, finite enemy spell phases, both allegiance outcomes and ordinary alternatives.
- Added scene-specific illustrations, visible enemy HP, preserved weapon artwork and independent adventure/character import tests.
- Selected GPL-3.0-only for original code, generic artwork and adventures; retained InkJS MIT and SRD CC BY 4.0 notices.

## Verification scope
The suite includes historical engine/arithmetic/CLI/save/DOM tests, 6,000 mixed-action seeded runs through the new adventure, all scene/action and check-outcome coverage, both-allegiance no-spell viability, boon persistence/rejection, 46 scene/state SVG renders, and both import orders. The separate difficulty study has 5,400 trials with nine builds and two declared policies; see BALANCE.md and tests/balance-results.json.

These are automated headless and simulated-DOM checks with reviewed CPU-rendered artwork. They do not establish new Windows/macOS execution, actual file:// browser behavior, exhaustive security review or human balance approval. CI status, if present, must be checked for the specific published commit; configured jobs are not passed jobs.

## Compatibility
Existing version-1 characters and saves still load with their original matching adventure. New abilities and boon actions need engine 0.2.0 or later. Original characters are never silently rewritten to suit a story. Story boons are not exported as permanent character powers. Changing an adventure’s content after release requires an adventure version bump when saves would change meaning.

## Play
Extract the entire ZIP or GitHub repository archive and open START.html. Pick an included adventure, or import a .ctrpg pack. Import your character JSON independently, review fit, and begin. For saved journeys, load the matching adventure before importing its save. No server, account, network or npm install is needed to play the packaged browser game.
