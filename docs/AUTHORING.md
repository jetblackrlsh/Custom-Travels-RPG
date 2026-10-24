# Authoring adventures

## Architecture

`src/catalog.js` owns character creation and the shared catalog. `src/engine.js` owns checks, damage, charges, state, and persistence. Ink owns passage flow. `compile.cjs` compiles an adventure manifest into Ink JSON using inkjs 2.4.0. `src/app.js` is presentation only; the CLI uses the same engine. Never implement separate browser/headless rules.

Use the included manifests as schema references, not plots to reskin. Design a new beat outline first. Write original fiction and use generic Studio assets. Do not import the reference tutorial's narrative, art, or compiled files.

## Manifest

Required: `id` (lowercase slug), `version` (integer), `title`, `summary`, `entry`, `supportedAbilities`, `nodes`, `actions`, `enemies`.

A node has `title`, Ink-compatible `text`, optional `background` and `npc` appearance label, and ordered `actions` (IDs). Node IDs use letters, numbers, and underscores, starting with a letter or underscore. An empty actions array is an ending. Text may use `{flag("some_flag"):yes text|no text}`. Avoid unescaped Ink control syntax in ordinary prose. Compiler errors must be fixed, not ignored.

An action has `label`, four node targets (`success`, `failure`, `victory`, `defeat`), and optional:
- `spell`: catalog ID. Runtime checks ownership and charges; costs one charge on attempted use.
- `check`: `{ability, proficiency?, dc, targetType?}`. Ability is STR/DEX/CON/INT/WIS/CHA or `weapon`. Proficiency is a catalog name or `weapon`. `targetType` is DC or AC.
- `enemy`: enemy ID; `damage`: fixed integer or dice string, e.g. `1d6+1`.
- `retaliation`: fixed integer or dice string. Applied after the attempt unless the enemy was defeated, or a successful Shocking Grasp suppresses it.
- `failureDamage`: only on failed checks.
- `heal`: applied on success; keep recovery actions bounded using `once` and/or explicit story routing.
- `flag`: set true on success; `requiresFlag`: gate an option.
- `once`: remove the action after one attempt in that run.
- `successText`, `failureText`: outcome explanations shown in the journal and result panel.

An enemy has `name`, positive `hp`, and `ac`. Attack check DCs should match the enemy AC. All targets, including defeat, must exist. Outcome code precedence is defeat, enemy defeated, success, failure. A dead enemy does not retaliate. HP cannot drop below zero or healing exceed maximum.

Damage formulas support 1–20 dice, 2–100 sides, optional integer modifier. Fixed damage must be 0–100. Always explain whether damage is fixed or rolled. Do not print “the DM rolls” without actually using the dice service. Do not use Ink RANDOM for checks: route all mechanical randomness through the shared engine.

## Ability coverage

Declare exactly the abilities with authored opportunities. Every listed opportunity must be reachable with a valid character and sufficient charges, not merely present in dead text. Jet's authored adventures must cover all seven abilities. This is an authoring standard, not a reason to reject third-party adventures that truthfully advertise fewer.

Review each obstacle for plausible magic and ordinary alternatives. Do not force unrelated spells into a scene. No mandatory obstacle may require a spell or remaining charge. This guarantees participation, not victory: failures and defeat are legitimate outcomes. Some proficiencies may never arise; do not reject a character for that.

Keep spell consequences meaningful and bounded. Avoid limitless Sleep against every target, unlimited healing retries, or claiming that Persuasion is literal mind control. Let routes reconverge when their changes are represented in HP, charges, flags, information, or later consequences. Charge recovery is not implemented as a generic author field in v0.1; add and test it deliberately if later needed.

## Visuals

Use the bundled generic Studio core, stagecraft, puppet animations, backgrounds, props, and effects. The first renderer supports the Studio background IDs plus aliases `library`, `dungeon`, `stone-bridge`. Characters preserve appearance recipes with `assetVersion: studio-1.6-core1`. Never change the meaning of an existing part ID without migration. Do not place personal story art in generic engine assets.

## Build and test

1. Run `node compile.cjs INPUT.manifest.json OUTPUT.ctrpg`.
2. Run `node cli.cjs validate OUTPUT.ctrpg` and fix every error.
3. Play headlessly with all premades and representative custom builds. Exercise success/failure, no-charge routes, each ability, combat victory/defeat, save/restore, and endings.
4. Use test seeds only in tests through `new Game(pack, character, {testSeed: n})`. Test-mode sessions cannot produce normal gameplay saves.
5. Check the UI and actual rendered art. Test repeated clicks, Back/New, imports, restarting, reduced motion, and invalid inputs. Report verification gaps honestly.
6. Run `node package.cjs OUTPUT.ctrpg OUT_DIR` and ZIP the directory. Confirm opening START.html needs no server or remote assets. Include attribution, rules, source, and headless tools.

Structural checks cannot prove narrative eligibility or exhaustive semantic reachability. Review and playtest, rather than equating a green validator with a finished adventure.

## 0.2.0 additions
See SLIME-QUEEN.md for Giant, Illusory Duplicate, suppressRetaliation and bounded grantBoon. Author all nine abilities for owner-requested adventures unless a narrower scope is explicit. Existing adventures may truthfully declare only their original seven. Do not claim every route supports every ability.
