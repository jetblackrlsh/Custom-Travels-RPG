# Scene-accurate illustration pass (0.1.3)

The adventure's words, outcomes, dice, charges and encounter balance are unchanged. These illustrations depict the current scene and its current state, not a reenactment of the previous scene's attack.

- Temple: weakened Auralith rests low on the copper-linked bed; the saved ending shows a standing god and restored pulse contacts.
- Causeway: elevated conduit, sheltered stair, weakened parent dragon and hatchling. No generic unrelated guard.
- Archive: three-contact pulse diagram and workspace, not a meeting with an invented scholar.
- Laboratory entrance: hooded living hound, lead, apprentice and actual door.
- Confession: Sereth, a distinct restorative vessel, induction apparatus and workbench. Her father's mask appears when that history is discussed.
- Homunculi fight: clay/glass bodies and remaining group health; damaged-state debris and fewer standing constructs after damage.
- Sereth confrontation: the cure is held at her side, rather than left floating in a generic scene.
- Dragon route: both dragons arrive; the bronze one lies weakened while the silver one presses the second fight. Both are still in the death ending.
- Return: hero carries the restorative at the puppet's wrist, and the pulse contacts are visible.
- Defeat: hero is down; the dragon-rescue defeat ending shows a dragon with the cure.
- Fairy ancestry is illustrated with wings, without changing mechanical capabilities. Trident attacks use a three-pronged prop instead of a generic sword.

Source: src/story-illustrations.js and existing generic Studio components. Scene drawings remain stylized SVG illustrations with limited puppet motion, not fully choreographed cartoons. The 3D actual-play adaptation is a separate deliverable.

All 19 scene render paths and combat-held trident paths are exercised in tests/story-art.cjs. Rendered previews are reviewed separately from structural assertions. Future authors must create a scene/state ledger, reuse assets rather than copy encounter plots, and check that active characters, props, conditions and locations match the text.

## Weapon coverage in 0.1.4

Every one of the 37 catalog weapons has an explicit original SVG silhouette in `src/weapon-art.js`. There is no sword fallback. Related weapons differ in blade shape, haft length, head size, or construction silhouette: for example, shortbow/longbow and hand/light/heavy crossbows remain distinguishable. Unknown weapon names fail rather than quietly choosing unrelated artwork.

Both the scene-specific Dragon God illustrations and the generic adventure puppet use this shared adapter. Attack families select slash, overhead, thrust, staff, throwing, bow, sling, aimed-shot, long-gun, or blowgun poses. Long guns use the support-hand preset. These are stylized poses, not contact-accurate fighting choreography or projectile simulation. Artwork does not change damage, range, proficiency, or any other game rule.

Weapons remain hidden for ordinary dialogue, travel, spellcasting, and when a previous scene's attack no longer applies. They are intentionally not held throughout every gesture. Portraits remain clean, unarmed character portraits.

When extending the catalog, add a named visual definition and regression coverage in the same change. Run `node tests/weapons.cjs`: it checks exact catalog coverage, distinct silhouette data, 740 timed scene renders across four encounters, and no weapon leakage into dialogue. Review generated weapon previews visually as well; structural tests cannot certify good posing.
