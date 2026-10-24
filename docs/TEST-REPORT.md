# Current release

See RELEASE-0.2.0.md and BALANCE.md for the new release scope and measured difficulty. The material below records earlier test passes and their original limitations, not fresh platform certification.

# Verification report — 0.1 test candidate

Date: 2026-10-22. Scope: Custom Travels RPG engine, companion authoring workflow, and The Lantern Under the Flood.

## Passed

- InkJS 2.4.0 compilation and execution, not a substitute interpreter.
- Thirteen core test groups: all premades valid; bad character inputs rejected; manifest structural checks; fixed/rolled damage; secure dice range/all faces sampled; both success and failure for the same action; proficiency arithmetic; known/unknown spell gating and charge deduction; save/load; ward consumption/expiration; all seven opportunities reachable; 500 no-magic playthroughs (five premades × 100 seeds); combat victory and defeat.
- Additional tests: same character and appearance imported into an independently compiled second adventure; weapon-category and saving-throw proficiency; Shocking Grasp hit/miss and prevented counterattack; exhaustion removes spell choices.
- Simulated DOM tests: startup, five SVG premade cards, editable puppet, character validation, preflight, complete playthrough, local resume, restart, and custom text escaping.
- Actual CLI start, choice, and JSON save flow without any server.
- Studio-generated SVG scene rendered to PNG and visually inspected. Rain/dusk presentation added to match the storm setting. This is artwork validation, not a screenshot of the browser UI.

## Not verified in a live browser

The cloud browser could not reach the execution workspace's local preview server (connection refused). Launching the local Chromium process failed due to a restricted socket operation. No browser security settings were disabled to work around this.

Consequently, real-browser file:// launch, CSS layout at desktop/mobile sizes, actual browser file picker/download dialogs, and animation performance remain unverified here. The simulated DOM tests do not establish those results. The ZIP is a test candidate for a normal browser, not a fully browser-certified release.

## Scope and balancing limits

Build budgets and seven spell effects are an initial balancing pass. The demo is intentionally short. Only generic shared-engine effects are automated; authors still determine plausible spell opportunities and their narrative consequences. No audio soundtrack, free-text action parser, progression, or comprehensive tactical combat is included.

# Agent-hardening update — 0.1.1

Date: 2026-10-22. Executed locally on Linux, Node.js 24.19.0.

## New executed checks

- 3,000 deterministic mixed-action campaigns, 21,374 decisions. All nine demo scenes and 21 action IDs selected; success, failure, combat victory and defeat observed. Each campaign reached an ending within the test bound. HP/charge bounds and offered-action eligibility checked after every decision.
- 7,200 check-arithmetic cases: six ability modifiers, owned/unowned proficiency, every d20 face, and DC 1–30, including equality-at-DC boundaries.
- 1,440 valid array/profile combinations: 360 unique permutations (the array contains two +2 entries) across four profiles. All 37 starting weapons checked for automatic training and legal attack ability.
- 50 additional cryptographically random campaigns save/restore after every decision, asserting identical view on restore.
- CLI subprocess tests for discovery, catalog, version, malformed JSON, 5 MiB size limit, missing files, argument errors, character validation, end-to-end gameplay, paths with spaces, unrelated working directory, read-only show, overwrite refusal, rejected actions and terminal-state action rejection.
- Invalid dice sides/formulas and corrupted save-state fields rejected; malformed adventure structure returns a validation report rather than throwing out of the validator.
- Fresh generated distribution without node_modules runs CLI and the example agent; repeated packaging refuses to overwrite a directory.
- Clean extracted-style directory: npm ci --ignore-scripts installed dependencies successfully; full engine, integration and simulated-DOM suite plus build and example passed. Package tests additionally verify the no-install runtime.
- npm audit reported zero known registry advisories at this check. This does not audit custom code or vendored Studio assets and is not a security certification.

## Fixes and documentation changes

- CLI now has JSON help/version/catalog and character-validation commands; machine-readable errors and defined exit codes.
- Starting a session refuses to overwrite an existing save. CLI inputs are bounded. Save restoration checks more malformed fields.
- secureDie rejects unsupported sides instead of risking undefined behavior or a loop.
- Added agent quickstart, executable agent example, contributor guidance, trust-boundary documentation, public-release checklist, and CI configuration.
- Corrected setup distinction: Node 20+ for the no-install player runtime, Node 24.15+ for the current developer dependency set. The core, expanded headless and no-install packaging tests also passed on Node.js 20.20.2.

The original live-browser gap above remains. Windows/macOS CI has not run. The suite is materially stronger but does not establish exhaustive semantic coverage, independent security review, balancing, or public licensing readiness. See RELEASE-CHECKLIST.md.

The Node 20 run repeats the same test scenarios for runtime compatibility; its simulations are not counted as additional distinct coverage.

# New example — 0.1.2

The default is now The Last Pulse of Heaven (19 scenes, 47 actions). Legacy lantern tests remain regression fixtures rather than being silently rewritten to fit the new story.

- 1,000 nonmagical campaigns: five premades × two allegiances × 100 seeds. All reached the intended ending in this selected seed set. This is an easy introductory combat balance, not a guarantee of victory.
- 4,000 mixed-choice campaigns, 53,384 decisions; all 47 actions selected, all seven abilities used, both success and failure observed for all 20 authored checks.
- Across mixed exploration and explicit bad-luck defeat fixtures, all 19 scenes and four ending variants executed. One rare defeat was tested by an explicit failing-die fixture rather than claimed as random coverage.
- Allegiance lock and save/restore at the branch point tested. No-magic campaigns assert zero spell actions in their logs.
- Both intended endings passed simulated-DOM runs with deterministic successful dice fixtures. Those UI fixtures do not replace or modify normal gameplay randomness.
- Dragon God, alchemist laboratory, homunculi and weakened-dragon SVG frames rendered for artwork inspection. Real browser layout/file:// limitations remain as previously documented.

Tests establish implementation behavior, not exhaustive literary quality or long-term balance. Public distribution still awaits authorization and license selection.

The final ZIP was extracted and its default CLI startup and complete example-agent run verified without node_modules. The new adventure suite also passed on Node 20.20.2 from that extracted package.

# Scene-accurate illustration pass — 0.1.3

No story branch, encounter stat, roll rule, resource allowance or damage value changed. The existing headless and simulated-DOM suite passed with the new illustration renderer. New SVG tests render all 19 scene states and all four combat trident paths. Rendered frames were inspected, including the weakened versus recovered god, both dragons, the hooded hound, diagram, cure ownership, homunculus damage state and defeat pose. A duplicate SVG ID and a root-animation override of the defeat pose were found and fixed during review.

The illustration improvements are stylized state depictions, not fully animated combat or independent live-browser verification. Prior human browser reports apply to their tested builds, not every updated illustration.

## 0.1.4 weapon artwork regression

37/37 current weapon choices now map explicitly to distinct SVG geometry. The weapon test renders every choice at five timestamps in all four Dragon God combat scenes (740 renders), validates finite geometry, rejects unknown weapon names, and checks that dialogue and stale scene actions do not retain weapons. All 37 contact-sheet previews were visually reviewed. These are software-rendered SVGs and simulated DOM tests, not a claim of live browser or controller testing. The rules and save/character formats are unchanged.
