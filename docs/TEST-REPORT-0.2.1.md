# Verification: 0.2.1

October 24, 2026. Core Charged Strike update and non-magical authoring guidance.

## Passed locally
- Full npm test aggregate and npm run build on Node 24. The aggregate includes 1,440 legal character combinations, 7,200 check cases, all 37 weapon mappings, 3,000 mixed generic campaigns, 1,000 directed and 4,000 mixed Dragon campaigns, 6,000 mixed Slime Queen campaigns, import/save/restore/error handling, distribution tests and simulated-browser tests.
- Focused Charged Strike tests: no preparation damage, normal response, hit/miss, fixed and rolled bonus accounting, no stacking, no spell bonus, multi-target isolation, wards, lethal preparation, victory and scene-exit cleanup, persistence, malformed save rejection, and illegal out-of-scene requests.
- An authentic 0.2.0 generic Fighter save and the unchanged Slime Queen pack gain the core action without edits to the adventure. No private player character is used in the published fixture.
- Simulated browser: action button, HP cost, ready badge, no fake d20 during preparation, unavailable repeat preparation, save/resume, and consuming the preparation on attack. Presentation and mechanics share the engine.
- Node 20 focused mechanics/validator checks with authoring dependencies available. The standalone CLI requires no npm dependency or server; final distribution smoke is recorded separately at delivery.
- 5,000 additional deterministic balance runs comparing basic attacks with a documented selective-charge policy across five builds. See CHARGED-STRIKE-BALANCE.md and tests/charged-balance-results.json. This is sample evidence, not proof of universally optimal tactics.

## Scope and limits
The installed companion skill and repository companion both require at least two genuinely different non-magical approaches to every problem. Existing adventures are not comprehensively redesigned by this patch; the core action appears automatically in their eligible weapon combats.

Normal gameplay uses secure randomness. Test seeds are QA only. Historical actual-play rolls are not altered.

Real browser/file:// UI testing and new cross-platform CI are not implied by local simulated-DOM tests. Check the GitHub Actions run for the published commit before claiming that release passed the matrix. Visual tests do not establish comprehensive artistic quality.
