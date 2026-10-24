VAR result = 0
EXTERNAL available(id)
EXTERNAL act(id)
EXTERNAL flag(id)
-> summons

=== summons ===
# scene:summons
The bells of Caer Vey ring without hands. Beneath the cathedral keep, Auralith, God of Dragons, lies across a bed of copper conduits. Each faltering heartbeat dims the aether mills above. Across the kingdom, dragons stumble in flight and hatchlings struggle to breathe. Their lives are bound to this one life.

For generations Auralith has restrained feuding broods, broken sieges and sheltered villages beneath their wings. That great power has usually protected the realm. Today it cannot keep its own bearer alive.
+ {available("hear_petition")} [Approach the dying Dragon God. # action:hear_petition]
~ result = act("hear_petition")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> petition
- result == 1:
 -> petition
- else:
 -> petition
}

=== petition ===
# scene:petition
“Chief Alchemist Sereth Voss understands the venom in my blood,” Auralith says. “Bring the restorative she promised. If I die, every dragon dies with me.” A brass courier cylinder carries your authority to enter her laboratory.

Auralith makes no promise of treasure, only a quiet request: “Let the young have a tomorrow.” You leave knowing the stakes, but not yet knowing how the poison reached them.
+ {available("depart")} [Carry the commission to the Alchemical Spire. # action:depart]
~ result = act("depart")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> causeway
- result == 1:
 -> causeway
- else:
 -> causeway
}

=== causeway ===
# scene:causeway
An elevated stone causeway joins the keep to the Alchemical Spire. Its copper ribs spit blue sparks as the failing aether engines stutter. The direct crossing is dangerous, but a sheltered stair runs beneath it.
+ {available("ward_causeway")} [Cast Shield of Faith and cross the sparks. # action:ward_causeway]
~ result = act("ward_causeway")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> archive
- result == 1:
 -> archive
- else:
 -> archive
}
+ {available("dash_causeway")} [Time your crossing between discharges. (DEX / Acrobatics, DC 11) # action:dash_causeway]
~ result = act("dash_causeway")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> archive
- result == 1:
 -> archive
- else:
 -> archive
}
+ {available("sheltered_stair")} [Take the sheltered stair beneath the bridge. # action:sheltered_stair]
~ result = act("sheltered_stair")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> archive
- result == 1:
 -> archive
- else:
 -> archive
}

=== archive ===
# scene:archive
In the Spire vestibule, an antique diagram shows one vast heart joined to thousands of smaller ones. Its labels are in Old Draconic. Beside it, modern medical notes identify a synthetic poison and a single restorative vessel. Understanding the diagram may help you reconnect the cure to Auralith safely.
+ {available("read_pulse")} [Cast Comprehend Languages on the ancient diagram. # action:read_pulse]
~ result = act("read_pulse")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> outer_lab
- result == 1:
 -> outer_lab
- else:
 -> outer_lab
}
+ {available("study_pulse")} [Compare the diagram with the modern notes. (INT / Investigation, DC 12) # action:study_pulse]
~ result = act("study_pulse")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> outer_lab
- result == 1:
 -> outer_lab
- else:
 -> outer_lab
}
+ {available("leave_pulse")} [Continue without deciphering the diagram. # action:leave_pulse]
~ result = act("leave_pulse")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> outer_lab
- result == 1:
 -> outer_lab
- else:
 -> outer_lab
}

=== outer_lab ===
# scene:outer_lab
A flesh-and-blood basilisk hound sleeps fitfully beside the inner door, its eyes covered by a velvet hood. A frightened apprentice holds its lead and refuses to move while an alarm rings. Neither has attacked you. A service passage is open, but a calming approach would get you through directly.
+ {available("sleep_hound")} [Cast Sleep on the restless hound. (INT, DC 10) # action:sleep_hound]
~ result = act("sleep_hound")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> confession
- result == 1:
 -> confession
- else:
 -> outer_lab
}
+ {available("command_apprentice")} [Use Command: “Open.” (WIS, DC 10) # action:command_apprentice]
~ result = act("command_apprentice")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> confession
- result == 1:
 -> confession
- else:
 -> outer_lab
}
+ {available("show_commission")} [Explain the royal commission. (CHA / Persuasion, DC 10) # action:show_commission]
~ result = act("show_commission")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> confession
- result == 1:
 -> confession
- else:
 -> confession
}
+ {available("service_passage")} [Use the open service passage. # action:service_passage]
~ result = act("service_passage")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> confession
- result == 1:
 -> confession
- else:
 -> confession
}

=== confession ===
# scene:confession
Chief Alchemist Sereth Voss stands beside a potion suspended inside a brass induction ring. Glass vessels, copper nerves and rune-etched retorts crowd her stone laboratory.

“I made the poison,” she says before you can ask. “Auralith killed my father. He hunted dragons because he believed no creature should have that much power over everyone else. He wanted them eliminated.”

She does not deny the god’s protection of the kingdom. “Benevolence is not a restraint. Today they choose mercy. What happens when they choose otherwise?”

The restorative is real. Sereth kept it to study the venom’s reversal and has not yet destroyed it. She asks you to stand beside her until the last heartbeat passes. Saving the god preserves every dragon; helping her means letting them all die.
+ {available("ask_father")} [Ask what happened to her father. # action:ask_father]
~ result = act("ask_father")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> father
- result == 1:
 -> father
- else:
 -> father
}
+ {available("ask_dragons")} [Ask about the dragons who never harmed anyone. # action:ask_dragons]
~ result = act("ask_dragons")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> innocents
- result == 1:
 -> innocents
- else:
 -> innocents
}
+ {available("take_tonic")} [Drink the ordinary restorative offered on the workbench. (Recover up to 4 HP; once) # action:take_tonic]
~ result = act("take_tonic")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> confession
- result == 1:
 -> confession
- else:
 -> confession
}
+ {available("save_god")} [Side with Auralith: take the cure and save the Dragon God. # action:save_god]
~ result = act("save_god")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> rescue_guard
- result == 1:
 -> rescue_guard
- else:
 -> rescue_guard
}
+ {available("side_alchemist")} [Side with Sereth: keep the cure from the dragons until the god dies. # action:side_alchemist]
~ result = act("side_alchemist")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> dragon_arrival
- result == 1:
 -> dragon_arrival
- else:
 -> dragon_arrival
}

=== father ===
# scene:father
Sereth lifts a dented hunting mask from a shelf. Her father brought an aether lance to a dragon nesting ground. Auralith intercepted him and killed him before the lance could discharge.

“He thought he was preventing a future catastrophe,” she says. “Auralith thought they were preventing one that morning.” Her grief is real. So is the difference between a man who chose to hunt and the hatchlings now dying for his death.
+ {available("return_from_father")} [Return to the decision. # action:return_from_father]
~ result = act("return_from_father")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> confession
- result == 1:
 -> confession
- else:
 -> confession
}

=== innocents ===
# scene:innocents
“There are healers among them. Young ones. Dragons who have never left their valleys,” you say.

Sereth looks toward the pulse gauge. “I know.” She will not pretend the poison distinguishes guilt. Her revenge has become a plan to remove an entire people’s power by removing their lives. You can understand her loss without accepting that conclusion, or decide that the danger she fears outweighs it. She leaves the choice to you.
+ {available("return_from_innocents")} [Return to the decision. # action:return_from_innocents]
~ result = act("return_from_innocents")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> confession
- result == 1:
 -> confession
- else:
 -> confession
}

=== rescue_guard ===
# scene:rescue_guard
You reach for the induction ring. Sereth strikes a summoning plate with her palm. Homunculi unfold from ceramic wombs: small clay bodies, glass ribs and hot copper sinews. They swarm between you and the cure while their maker seals the chamber.

The homunculi share 6 HP and AC 10. After each attack they deal 1 fixed damage unless defeated or prevented. You must fight through them to reach Sereth.
+ {available("rescue_guard_attack")} [Attack with your starting weapon. (4 fixed damage; AC 10) # action:rescue_guard_attack]
~ result = act("rescue_guard_attack")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> rescue_chief
- result == 1:
 -> rescue_guard
- else:
 -> rescue_guard
}
+ {available("rescue_guard_guiding_bolt")} [Cast Guiding Bolt. (8 fixed damage) # action:rescue_guard_guiding_bolt]
~ result = act("rescue_guard_guiding_bolt")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> rescue_chief
- result == 1:
 -> rescue_guard
- else:
 -> rescue_guard
}
+ {available("rescue_guard_shocking_grasp")} [Cast Shocking Grasp. (5 fixed damage) # action:rescue_guard_shocking_grasp]
~ result = act("rescue_guard_shocking_grasp")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> rescue_chief
- result == 1:
 -> rescue_guard
- else:
 -> rescue_guard
}
+ {available("rescue_guard_magic_missile")} [Cast Magic Missile. (5 fixed damage) # action:rescue_guard_magic_missile]
~ result = act("rescue_guard_magic_missile")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> rescue_chief
- result == 1:
 -> rescue_guard
- else:
 -> rescue_guard
}
+ {available("rescue_guard_ward")} [Cast Shield of Faith to block the next damaging event. # action:rescue_guard_ward]
~ result = act("rescue_guard_ward")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> rescue_guard
- result == 1:
 -> rescue_guard
- else:
 -> rescue_guard
}

=== rescue_chief ===
# scene:rescue_chief
The shattered homunculi fall silent. Sereth snatches the cure and braces one hand against a drain valve. You have only moments before she empties the vessel. You can fight her, or try to make her release it.

Sereth has 4 HP and AC 10. Her defensive shock baton deals 1 fixed damage after an attack unless prevented or she is defeated.
+ {available("rescue_chief_attack")} [Attack with your starting weapon. (4 fixed damage; AC 10) # action:rescue_chief_attack]
~ result = act("rescue_chief_attack")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> return_cure
- result == 1:
 -> rescue_chief
- else:
 -> rescue_chief
}
+ {available("rescue_chief_guiding_bolt")} [Cast Guiding Bolt. (8 fixed damage) # action:rescue_chief_guiding_bolt]
~ result = act("rescue_chief_guiding_bolt")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> return_cure
- result == 1:
 -> rescue_chief
- else:
 -> rescue_chief
}
+ {available("rescue_chief_shocking_grasp")} [Cast Shocking Grasp. (5 fixed damage) # action:rescue_chief_shocking_grasp]
~ result = act("rescue_chief_shocking_grasp")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> return_cure
- result == 1:
 -> rescue_chief
- else:
 -> rescue_chief
}
+ {available("rescue_chief_magic_missile")} [Cast Magic Missile. (5 fixed damage) # action:rescue_chief_magic_missile]
~ result = act("rescue_chief_magic_missile")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> return_cure
- result == 1:
 -> rescue_chief
- else:
 -> rescue_chief
}
+ {available("rescue_chief_ward")} [Cast Shield of Faith to block the next damaging event. # action:rescue_chief_ward]
~ result = act("rescue_chief_ward")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> rescue_chief
- result == 1:
 -> rescue_chief
- else:
 -> rescue_chief
}
+ {available("command_release")} [Use Command: “Drop.” (WIS, DC 12) # action:command_release]
~ result = act("command_release")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> return_cure
- result == 1:
 -> return_cure
- else:
 -> rescue_chief
}
+ {available("sleep_sereth")} [Cast Sleep before she turns the valve. (INT, DC 12) # action:sleep_sereth]
~ result = act("sleep_sereth")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> return_cure
- result == 1:
 -> return_cure
- else:
 -> rescue_chief
}

=== return_cure ===
# scene:return_cure
You secure the intact antidote and hurry back through the copper-ribbed streets. Behind you, Sereth is alive but disarmed, or asleep beside her broken creations. Her grief has not been cured by your victory.

At the cathedral keep, Auralith’s heartbeat is almost gone. Attendants stand ready to help. The restorative must reach the central pulse chamber.
+ {available("known_sequence")} [Use the pulse sequence you learned in the vestibule. # action:known_sequence]
~ result = act("known_sequence")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> god_saved
- result == 1:
 -> god_saved
- else:
 -> god_saved
}
+ {available("read_contacts")} [Cast Comprehend Languages on the pulse contacts. # action:read_contacts]
~ result = act("read_contacts")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> god_saved
- result == 1:
 -> god_saved
- else:
 -> god_saved
}
+ {available("stabilize_pulse")} [Stabilize the pulse while the attendants administer the cure. (WIS / Medicine, DC 11) # action:stabilize_pulse]
~ result = act("stabilize_pulse")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> god_saved
- result == 1:
 -> god_saved
- else:
 -> god_saved
}
+ {available("trust_attendants")} [Let the attendants use their slower manual procedure. # action:trust_attendants]
~ result = act("trust_attendants")
{
- result == 3:
 -> rescue_lost
- result == 2:
 -> god_saved
- result == 1:
 -> god_saved
- else:
 -> god_saved
}

=== dragon_arrival ===
# scene:dragon_arrival
You step between Sereth and the door. Wingbeats batter the terrace. Two weakened dragons land hard against its stone rail: a bronze dragon with trembling forelegs, and a smaller silver dragon whose breath catches between words.

“We were sent for the restorative,” the bronze dragon says. “If you will not bring it, we will.” They are completing the mission you accepted. You tell them they cannot pass. Sereth guards the cure behind you.
+ {available("hold_door")} [Defend the cure from the approaching dragons. # action:hold_door]
~ result = act("hold_door")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> bronze_fight
- result == 1:
 -> bronze_fight
- else:
 -> bronze_fight
}

=== bronze_fight ===
# scene:bronze_fight
The bronze dragon squeezes through the broken arch, too weak to fly or breathe a full torrent of fire. It fights to reach the cure, not for treasure or dominion. You must drive it away to keep Sereth’s plan intact.

The weakened bronze dragon has 6 HP and AC 10. Its exhausted blows deal 1 fixed damage after each attack unless prevented or it is defeated.
+ {available("bronze_fight_attack")} [Attack with your starting weapon. (4 fixed damage; AC 10) # action:bronze_fight_attack]
~ result = act("bronze_fight_attack")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> silver_fight
- result == 1:
 -> bronze_fight
- else:
 -> bronze_fight
}
+ {available("bronze_fight_guiding_bolt")} [Cast Guiding Bolt. (8 fixed damage) # action:bronze_fight_guiding_bolt]
~ result = act("bronze_fight_guiding_bolt")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> silver_fight
- result == 1:
 -> bronze_fight
- else:
 -> bronze_fight
}
+ {available("bronze_fight_shocking_grasp")} [Cast Shocking Grasp. (5 fixed damage) # action:bronze_fight_shocking_grasp]
~ result = act("bronze_fight_shocking_grasp")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> silver_fight
- result == 1:
 -> bronze_fight
- else:
 -> bronze_fight
}
+ {available("bronze_fight_magic_missile")} [Cast Magic Missile. (5 fixed damage) # action:bronze_fight_magic_missile]
~ result = act("bronze_fight_magic_missile")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> silver_fight
- result == 1:
 -> bronze_fight
- else:
 -> bronze_fight
}
+ {available("bronze_fight_ward")} [Cast Shield of Faith to block the next damaging event. # action:bronze_fight_ward]
~ result = act("bronze_fight_ward")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> bronze_fight
- result == 1:
 -> bronze_fight
- else:
 -> bronze_fight
}

=== silver_fight ===
# scene:silver_fight
The bronze dragon retreats from your blows. The silver dragon slips past its folded wing and reaches for the cure. “There are eggs in the mountain nurseries,” it says. “They have done nothing to you.”

The weakened silver dragon has 4 HP and AC 10. Its failing strikes deal 1 fixed damage after each attack unless prevented or it is defeated. You must repel it as well to keep the cure from them.
+ {available("silver_fight_attack")} [Attack with your starting weapon. (4 fixed damage; AC 10) # action:silver_fight_attack]
~ result = act("silver_fight_attack")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> last_heartbeat
- result == 1:
 -> silver_fight
- else:
 -> silver_fight
}
+ {available("silver_fight_guiding_bolt")} [Cast Guiding Bolt. (8 fixed damage) # action:silver_fight_guiding_bolt]
~ result = act("silver_fight_guiding_bolt")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> last_heartbeat
- result == 1:
 -> silver_fight
- else:
 -> silver_fight
}
+ {available("silver_fight_shocking_grasp")} [Cast Shocking Grasp. (5 fixed damage) # action:silver_fight_shocking_grasp]
~ result = act("silver_fight_shocking_grasp")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> last_heartbeat
- result == 1:
 -> silver_fight
- else:
 -> silver_fight
}
+ {available("silver_fight_magic_missile")} [Cast Magic Missile. (5 fixed damage) # action:silver_fight_magic_missile]
~ result = act("silver_fight_magic_missile")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> last_heartbeat
- result == 1:
 -> silver_fight
- else:
 -> silver_fight
}
+ {available("silver_fight_ward")} [Cast Shield of Faith to block the next damaging event. # action:silver_fight_ward]
~ result = act("silver_fight_ward")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> silver_fight
- result == 1:
 -> silver_fight
- else:
 -> silver_fight
}

=== last_heartbeat ===
# scene:last_heartbeat
Both dragons lie beyond the terrace arch, alive but unable to press through you. Sereth holds the restorative over the drain. She looks once at her father’s mask, then empties the vessel. The cure is gone. You have kept it from those who came to save their people.

The pulse gauge moves once more.
+ {available("witness_end")} [Stay beside Sereth through the last heartbeat. # action:witness_end]
~ result = act("witness_end")
{
- result == 3:
 -> alchemist_lost
- result == 2:
 -> god_dead
- result == 1:
 -> god_dead
- else:
 -> god_dead
}

=== god_saved ===
# scene:god_saved
Auralith draws a deep, unbroken breath. Across the kingdom, dragons lift their heads. In the mountain nurseries, hatchlings breathe again.

{flag("gentle_recovery"):The old pulse network steadies without a surge, sparing the wards weeks of repair.|The manual intervention saves their lives, though the damaged ward engines will take weeks to rebuild.}

You tell Auralith who made the poison and why. The god asks that Sereth be taken alive to answer for what she did. Her father remains dead; her loss remains real. But she has not been allowed to turn that loss into the death of every dragon. You chose to preserve their future.
-> END

=== god_dead ===
# scene:god_dead
Auralith’s heart stops. The bronze and silver dragons beyond the arch grow still. Far away, the same silence reaches every brood and every unhatched life tied to the god.

Sereth has avenged her father and ended the power he feared. She waits for triumph, but the laboratory is only quiet. The kingdom must now face its storms, wars and wounded without the protectors it depended upon.

You helped make that world. No dragon will rule it. No dragon will ever choose to save it, either.
-> END

=== rescue_lost ===
# scene:rescue_lost
You fall before you can bring the cure back. Sereth orders her surviving creations to carry you from the laboratory, then destroys the restorative. You awaken to silent bells and empty skies. Auralith has died, and every dragon with them.

You chose to save them. This time, that choice was not enough.
-> END

=== alchemist_lost ===
# scene:alchemist_lost
Your strength fails. The dragons push past you, take the restorative and lift away from the terrace before Sereth can destroy it. They leave you breathing on the stone.

By morning, Auralith’s heartbeat has steadied and the dragons are recovering. Sereth is taken alive to answer for the poisoning. You chose her cause, but could not keep the cure from those who needed it. The Dragon God survives despite your attempt to stop the rescue.
-> END
