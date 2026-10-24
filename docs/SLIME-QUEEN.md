# The Slime Queen’s Offer

Original premise by Nicholas Alexander Benson, adapted from his October 24, 2026 dream. Names, dialogue and incidental scenery are adaptation choices. The core sequence retains the possessed villager, mountain stair and second slime, Giant shortcut, two-plate entrance, queen’s offer and two opposing final confrontations.

## Player workflow
Open START.html. Choose an included adventure or use Import file to load a .ctrpg adventure. Import a separate character JSON in either order. Review its ability fit and begin. Each adventure uses the same engine; a standalone game ZIP is optional. To resume, first select/import the matching adventure, then import its save. Character files are portable across adventures; saves belong to one adventure ID/version.

## Reusable new mechanics
- Giant: CON +2 vs the authored DC, one charge on success or failure. A height shortcut or one empowered strike, not a persistent size simulation. The example strike deals 8 fixed damage (4 base +4 bonus).
- Illusory Duplicate: WIS +2 vs the authored DC. One charge. Supports an authored two-presence puzzle or a 4-damage attack which prevents its immediate counterattack on success. It does not create an independent actor with turns or permanent HP.
- suppressRetaliation: a boolean action field. On success it suppresses that action’s immediate counterattack only; failed attempts still receive their declared response. Separate failureDamage events are not blanket-immunized.
- grantBoon: a once-only action can grant an adventure-specific pool: {spells:[catalog IDs],charges:1..10}. It does not modify character known spells, build limits or exported appearance. Eligible casts spend this pool before personal charges. Save/restore preserves remaining charges. A grant cannot refill on repeat.

The queen grants two shared charges for Command/Illusory Duplicate. This supports a noncaster accepting her offer without turning the gift into permanent progression. Choosing to decline the gift remains possible but makes her route harder.

## Enemy spells
The queen spends one scripted charge on Command and one on a duplicate. These are finite encounter phases, not infinite stun loops. Command has a transparent player resistance check. Her duplicate can absorb one attack, including an explicitly disclosed Magic Missile interaction. Neither phase secretly rerolls outcomes.

The marshal spends two scripted charges: an 8-fixed-damage Guiding Bolt, then a 5-fixed-damage Magic Missile. This compact encounter uses an explicitly disclosed player Dexterity defense check for the bolt, not a hidden extra enemy attack roll. Ordinary cover does not stop the missile; a ward or successful duplicate/Command can. The subsequent staff fight has no remaining enemy spells.

## Scope and alternatives
Every one of the nine catalog abilities has a reachable authored opportunity. Noncasters can move the gate’s cart, climb the stair, fight with weapons and resist enemy spells. They are not promised victory. Retreat and defeat are real endings. The queen’s allegiance choice is irreversible within a run; the player can retreat afterward but cannot collect both side rewards.

## Visual ledger
Village/membrane: Mira inside translucent slime with her brother nearby. Mira scene: freed woman, brother, collapsed residue. Path/stair: mountain and winding steps; the second captive appears on the stair. Gate: two plates, cart, doorway. Inscription: threshold marks. Audience/decision: queen in the spring. Command: visible arc. Duplicate: one translucent decoy. Cloak: the traveler receives a translucent covering. Marshal phases: staff, radiant bolt or force missiles only where relevant. Freedom: uncoated residents; embrace: coated residents. Defeat/withdrawal do not invent a successful rescue. Player weapon artwork follows the equipped catalog item during weapon attacks, not dialogue.

## Testing
Run npm test, node tests/imports.cjs, and node tests/balance.cjs. Structural validation is not balance evidence. Seeded QA is labeled and cannot export normal-play saves; regular play uses cryptographic randomness. See the dated test and balance reports for actual results and limits.
