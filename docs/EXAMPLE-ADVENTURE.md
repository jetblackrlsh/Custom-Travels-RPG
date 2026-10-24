# The Last Pulse of Heaven

An original medieval science-fantasy example based on Nicholas Alexander Benson's premise. Stone keeps and cathedral halls coexist with copper aether conduits, induction rings, alchemical retorts, and artificial life. No reference-game fiction or art is reused.

## Player-facing pitch

The God of Dragons is dying. Their heartbeat sustains every dragon in the world. You are sent to fetch a restorative from the Chief Alchemist, but discover that she made the poison to avenge her dragon-hunter father. Decide whose future you will defend.

Content: poisoning, bereavement, combat, threatened extinction and consequential moral choices; non-graphic presentation. The player’s appearance, class label, ancestry and background do not force an allegiance.

## Author-facing route map (spoilers)

Summons → petition → causeway → archive → laboratory entrance → confession.

At the confession, optional conversations explain the father's death and the fate of innocent dragons. A once-only ordinary tonic restores up to 4 HP. It is clearly distinct from the unique antidote. Allegiance is chosen knowingly and cannot be switched after committing.

- Save Auralith: fight Sereth's summoned homunculi, confront Sereth, carry the cure back, administer it. Sereth can be subdued by combat or stopped with eligible Command/Sleep after the homunculus fight. The god survives and all dragons retain their lives.
- Help Sereth: two weakened dragons arrive to complete your original assignment. Fight and repel both, guard the cure until Sereth destroys it, witness the god's final heartbeat. The god and all linked dragons die.
- Rescue defeat: you fall before returning; Sereth destroys the cure, and the god dies despite your intention to save them.
- Alchemist-route defeat: dragons break through, take the cure, and save the god despite your opposition.

Combat defeat means incapacitation here, not automatically death. Narration consistently leaves Sereth and the player alive when they are defeated. The alchemist-route dragons are driven back by combat; they die with the god if that route succeeds.

## Mechanics and ability coverage

- Shield of Faith: protect against a causeway discharge, or the next damaging event during each fight.
- Comprehend Languages: decipher the old pulse diagram, or read the contacts when returning with the cure. Knowledge produces a gentler recovery, not a mandatory magic gate.
- Sleep: settle the living hound, or stop Sereth from destroying the cure. It is not offered against the artificial homunculi.
- Command: compel the frightened apprentice to open the door, or compel Sereth to drop the cure. Both are brief actions with checks, not unrestricted mind control.
- Guiding Bolt, Shocking Grasp, Magic Missile: fight eligible opponents on either allegiance route. Existing damage, charge, and counterattack rules remain unchanged.

Every route can be played without spells. Causeway and entrance obstacles have ordinary routes. Combat must actually be fought on both allegiances; there is no unconditional bypass of the central conflict. This is deliberately an approachable introductory battle: AC 10, first opposition 6 HP, second 4 HP, and responses of 1 fixed damage. Bad rolls can still defeat a character. The pre-combat tonic is once-only and no generic unlimited recovery was added.

The administration scene distinguishes careful preparation from a more disruptive but successful rescue. It does not add a last-minute arbitrary check that negates the player's hard-won cure.

## Files and validation

- adventures/dragon.manifest.json: authored source.
- adventures/dragon.ctrpg: standalone importable story package.
- adventures/default.*: the same story selected for this distribution's startup.
- tests/dragon.cjs: allegiance, ability, check-outcome and ending tests.
- tests/dragon-ui.cjs: simulated-DOM default-startup and both principal endings.
- src/science-fantasy-art.js: generic code-native dragon, homunculus and laboratory SVG dressing, combined with Studio backgrounds and the player's Studio puppet.

The old lantern fixture is retained to catch engine regressions. It is not the default release adventure. Existing lantern saves remain usable when the matching lantern adventure is loaded; they cannot be restored into this new story.
