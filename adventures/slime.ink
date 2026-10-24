VAR result = 0
EXTERNAL available(id)
EXTERNAL act(id)
EXTERNAL flag(id)
-> guild

=== guild ===
# scene:guild
The Heroes Guild sends you to the village of Valeglass. Green slime has crept down from a mountain spring. Marshal Orlan asks you to find the missing residents and stop the source. He offers no reward for killing the villagers: bring them home, if you can.
+ {available("accept")} [Accept the commission and travel to Valeglass. # action:accept]
~ result = act("accept")
{
- result == 3:
 -> defeat
- result == 2:
 -> village
- result == 1:
 -> village
- else:
 -> village
}

=== village ===
# scene:village
A translucent shape crosses the square. Inside it is a woman, walking with her eyes open and her hands pressed against the membrane. A baker recognizes her as his sister Mira. Her voice emerges with a chorus behind it: We are loved. Her fingers keep scratching toward the sunlight.
+ {available("approach")} [Approach the moving membrane carefully. # action:approach]
~ result = act("approach")
{
- result == 3:
 -> defeat
- result == 2:
 -> membrane
- result == 1:
 -> membrane
- else:
 -> membrane
}
+ {available("observe")} [Watch its movements before approaching. (WIS / Perception, DC 10) # action:observe]
~ result = act("observe")
{
- result == 3:
 -> defeat
- result == 2:
 -> membrane
- result == 1:
 -> membrane
- else:
 -> membrane
}

=== membrane ===
# scene:membrane
The slime lashes at anyone who reaches for Mira. Cut or disrupt the outer membrane, not the woman inside it. Its AC is 10 and it has 8 HP. Each surviving response deals 1 fixed damage.
+ {available("membrane_attack")} [Attack the Possessing slime membrane with your weapon. (4 fixed damage; AC 10) # action:membrane_attack]
~ result = act("membrane_attack")
{
- result == 3:
 -> defeat
- result == 2:
 -> mira
- result == 1:
 -> membrane
- else:
 -> membrane
}
+ {available("membrane_guiding_bolt")} [Cast Guiding Bolt. (8 fixed damage; AC 10) # action:membrane_guiding_bolt]
~ result = act("membrane_guiding_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> mira
- result == 1:
 -> membrane
- else:
 -> membrane
}
+ {available("membrane_shocking_grasp")} [Cast Shocking Grasp. (5 fixed damage; AC 10) # action:membrane_shocking_grasp]
~ result = act("membrane_shocking_grasp")
{
- result == 3:
 -> defeat
- result == 2:
 -> mira
- result == 1:
 -> membrane
- else:
 -> membrane
}
+ {available("membrane_magic_missile")} [Cast Magic Missile. (Automatic 5 fixed damage) # action:membrane_magic_missile]
~ result = act("membrane_magic_missile")
{
- result == 3:
 -> defeat
- result == 2:
 -> mira
- result == 1:
 -> membrane
- else:
 -> membrane
}
+ {available("membrane_giant")} [Grow for one empowered strike. (CON DC 11; 8 fixed damage) # action:membrane_giant]
~ result = act("membrane_giant")
{
- result == 3:
 -> defeat
- result == 2:
 -> mira
- result == 1:
 -> membrane
- else:
 -> membrane
}
+ {available("membrane_illusory_duplicate")} [Attack behind a duplicate. (WIS DC 11; 4 fixed damage; block response) # action:membrane_illusory_duplicate]
~ result = act("membrane_illusory_duplicate")
{
- result == 3:
 -> defeat
- result == 2:
 -> mira
- result == 1:
 -> membrane
- else:
 -> membrane
}
+ {available("membrane_ward")} [Cast Shield of Faith. (Block the next damaging event here.) # action:membrane_ward]
~ result = act("membrane_ward")
{
- result == 3:
 -> defeat
- result == 2:
 -> membrane
- result == 1:
 -> membrane
- else:
 -> membrane
}
+ {available("sleep_membrane")} [Cast Sleep on the living slime. (INT DC 11) # action:sleep_membrane]
~ result = act("sleep_membrane")
{
- result == 3:
 -> defeat
- result == 2:
 -> mira
- result == 1:
 -> mira
- else:
 -> membrane
}
+ {available("retreat_membrane")} [Retreat and guide the baker away from the square. # action:retreat_membrane]
~ result = act("retreat_membrane")
{
- result == 3:
 -> defeat
- result == 2:
 -> path
- result == 1:
 -> path
- else:
 -> path
}

=== mira ===
# scene:mira
Mira falls free. She says the warmth inside was real, but so was her wish to leave. The baker binds your wounds with clean cloth and gives you water. She points to the mountain: the queen lives where the spring begins.
+ {available("bandage")} [Accept first aid. (Restore 2 HP once.) # action:bandage]
~ result = act("bandage")
{
- result == 3:
 -> defeat
- result == 2:
 -> path
- result == 1:
 -> path
- else:
 -> path
}
+ {available("decline_aid")} [Thank them and continue without first aid. # action:decline_aid]
~ result = act("decline_aid")
{
- result == 3:
 -> defeat
- result == 2:
 -> path
- result == 1:
 -> path
- else:
 -> path
}

=== path ===
# scene:path
A long stone stair coils around the mountain to the sanctuary at its summit. A trail of green slime runs over its lower steps. You can ascend on foot, or cast Giant to briefly grow large enough to step straight onto the summit.
+ {available("giant_step")} [Cast Giant and step onto the shelf. (CON DC 11) # action:giant_step]
~ result = act("giant_step")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> gate
- else:
 -> trail
}
+ {available("take_trail")} [Ascend the winding mountain stair. # action:take_trail]
~ result = act("take_trail")
{
- result == 3:
 -> defeat
- result == 2:
 -> trail
- result == 1:
 -> trail
- else:
 -> trail
}

=== trail ===
# scene:trail
A long stone stair winds around the mountain. Halfway up, another villager stands inside a living slime membrane, blocking the narrow path. Break the 4-HP membrane without striking the person inside. Its AC is 10; each surviving response deals 1 fixed damage. Giant could have bypassed this encounter.
+ {available("trail_attack")} [Attack the Stairway slime membrane with your weapon. (4 fixed damage; AC 10) # action:trail_attack]
~ result = act("trail_attack")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> trail
- else:
 -> trail
}
+ {available("trail_guiding_bolt")} [Cast Guiding Bolt. (8 fixed damage; AC 10) # action:trail_guiding_bolt]
~ result = act("trail_guiding_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> trail
- else:
 -> trail
}
+ {available("trail_shocking_grasp")} [Cast Shocking Grasp. (5 fixed damage; AC 10) # action:trail_shocking_grasp]
~ result = act("trail_shocking_grasp")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> trail
- else:
 -> trail
}
+ {available("trail_magic_missile")} [Cast Magic Missile. (Automatic 5 fixed damage) # action:trail_magic_missile]
~ result = act("trail_magic_missile")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> trail
- else:
 -> trail
}
+ {available("trail_giant")} [Grow for one empowered strike. (CON DC 11; 8 fixed damage) # action:trail_giant]
~ result = act("trail_giant")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> trail
- else:
 -> trail
}
+ {available("trail_illusory_duplicate")} [Attack behind a duplicate. (WIS DC 11; 4 fixed damage; block response) # action:trail_illusory_duplicate]
~ result = act("trail_illusory_duplicate")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> trail
- else:
 -> trail
}
+ {available("trail_ward")} [Cast Shield of Faith. (Block the next damaging event here.) # action:trail_ward]
~ result = act("trail_ward")
{
- result == 3:
 -> defeat
- result == 2:
 -> trail
- result == 1:
 -> trail
- else:
 -> trail
}
+ {available("trail_command")} [Command the slime to release its captive. (WIS DC 11) # action:trail_command]
~ result = act("trail_command")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> gate
- else:
 -> trail
}
+ {available("trail_retreat")} [Retreat down the mountain. # action:trail_retreat]
~ result = act("trail_retreat")
{
- result == 3:
 -> defeat
- result == 2:
 -> withdrawal
- result == 1:
 -> withdrawal
- else:
 -> withdrawal
}

=== gate ===
# scene:gate
Two pressure plates flank the sanctuary door. Both must be pressed at once. A stone cart lies nearby, and a carved inscription runs around the threshold. Your magical duplicate can briefly exert enough force on a plate in this adventure.
+ {available("read_inscription")} [Cast Comprehend Languages on the threshold. # action:read_inscription]
~ result = act("read_inscription")
{
- result == 3:
 -> defeat
- result == 2:
 -> inscription
- result == 1:
 -> inscription
- else:
 -> inscription
}
+ {available("duplicate_gate")} [Cast Illusory Duplicate on the second plate. (WIS DC 10) # action:duplicate_gate]
~ result = act("duplicate_gate")
{
- result == 3:
 -> defeat
- result == 2:
 -> audience
- result == 1:
 -> audience
- else:
 -> gate
}
+ {available("cart_gate")} [Roll the stone cart onto one plate and stand on the other. # action:cart_gate]
~ result = act("cart_gate")
{
- result == 3:
 -> defeat
- result == 2:
 -> audience
- result == 1:
 -> audience
- else:
 -> audience
}

=== inscription ===
# scene:inscription
The inscription promises refuge to willing travelers, and a road home for anyone who wishes to leave. Beneath it, a newer layer of slime covers the word willing. You now have a concrete question to put to the queen, not proof of what she will answer.
+ {available("back_to_gate")} [Return to the pressure plates. # action:back_to_gate]
~ result = act("back_to_gate")
{
- result == 3:
 -> defeat
- result == 2:
 -> gate
- result == 1:
 -> gate
- else:
 -> gate
}

=== audience ===
# scene:audience
A woman of luminous green slime rises from the spring. She calls herself Queen Liora. She claims her cloak grants overwhelming love and an undead life that never ends through aging. She offers you Illusory Duplicate and Command if you join her and defeat Marshal Orlan, allowing her to spread through Valeglass. You have not accepted anything yet.
+ {available("ask_freedom")} [Ask whether someone can choose to leave her love. # action:ask_freedom]
~ result = act("ask_freedom")
{
- result == 3:
 -> defeat
- result == 2:
 -> answer
- result == 1:
 -> answer
- else:
 -> answer
}
+ {available("cite_covenant")} [Show her the covenant’s promise of a road home. # action:cite_covenant]
~ result = act("cite_covenant")
{
- result == 3:
 -> defeat
- result == 2:
 -> answer
- result == 1:
 -> answer
- else:
 -> answer
}
+ {available("choose_side")} [Consider the two paths. # action:choose_side]
~ result = act("choose_side")
{
- result == 3:
 -> defeat
- result == 2:
 -> decision
- result == 1:
 -> decision
- else:
 -> decision
}

=== answer ===
# scene:answer
Liora says anyone who truly feels her love would never want to leave. You ask about those who do. She calls that desire a wound she can heal by holding them closer. She may believe her promise, but she will not offer an exit.
+ {available("weigh_answer")} [Make your decision. # action:weigh_answer]
~ result = act("weigh_answer")
{
- result == 3:
 -> defeat
- result == 2:
 -> decision
- result == 1:
 -> decision
- else:
 -> decision
}

=== decision ===
# scene:decision
Refusing means fighting Liora to break her hold. Accepting means receiving her cloak and fighting the guild that protects the village. This is a choice about other people’s freedom as well as your own. Neither path is chosen for you.
+ {available("refuse_queen")} [Refuse: free the village from the queen’s control. # action:refuse_queen]
~ result = act("refuse_queen")
{
- result == 3:
 -> defeat
- result == 2:
 -> queen_command
- result == 1:
 -> queen_command
- else:
 -> queen_command
}
+ {available("accept_queen")} [Accept: join the queen and challenge the guild. # action:accept_queen]
~ result = act("accept_queen")
{
- result == 3:
 -> defeat
- result == 2:
 -> cloak
- result == 1:
 -> cloak
- else:
 -> cloak
}

=== cloak ===
# scene:cloak
Warm green light folds around you. The queen’s chorus joins your thoughts, but you retain your present choices. Her gift provides two adventure-only charges shared between Command and Illusory Duplicate. It does not alter your exported character or refill your personal spell charges. She sends you back to face Marshal Orlan.
+ {available("receive_cloak")} [Receive the two-charge gift and return to Valeglass. # action:receive_cloak]
~ result = act("receive_cloak")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal
- result == 1:
 -> marshal
- else:
 -> marshal
}
+ {available("decline_gift")} [Continue without accepting the extra spell charges. # action:decline_gift]
~ result = act("decline_gift")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal
- result == 1:
 -> marshal
- else:
 -> marshal
}

=== queen_command ===
# scene:queen_command
Liora raises one hand and orders you to kneel. Her voice tightens around your muscles. This uses the first of her two spell charges. Resist now; failure costs this exchange and lets her strike for 2 fixed damage. Her Command will not repeat indefinitely.
+ {available("resist_command")} [Resist her Command. (WIS / WIS Saving Throw, DC 11) # action:resist_command]
~ result = act("resist_command")
{
- result == 3:
 -> defeat
- result == 2:
 -> queen_double
- result == 1:
 -> queen_double
- else:
 -> queen_double
}
+ {available("counter_command")} [Cast Command: Silence. (WIS DC 11) # action:counter_command]
~ result = act("counter_command")
{
- result == 3:
 -> defeat
- result == 2:
 -> queen_double
- result == 1:
 -> queen_double
- else:
 -> queen_double
}
+ {available("shield_command")} [Cast Shield of Faith while the command takes hold. # action:shield_command]
~ result = act("shield_command")
{
- result == 3:
 -> defeat
- result == 2:
 -> queen_double
- result == 1:
 -> queen_double
- else:
 -> queen_double
}

=== queen_double ===
# scene:queen_double
Liora spends her last charge on a duplicate. Two queens advance. One is a brief decoy, not a second enemy with its own health. It can absorb one attack, including Magic Missile. You can read the ripples beneath them or make it vanish by striking. After this exchange, she has no spell charges left.
+ {available("read_ripples")} [Identify the real queen by her ripples. (WIS / Perception, DC 10) # action:read_ripples]
~ result = act("read_ripples")
{
- result == 3:
 -> defeat
- result == 2:
 -> queen_battle
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("break_decoy")} [Strike the decoy. (No enemy damage; take 1 fixed damage.) # action:break_decoy]
~ result = act("break_decoy")
{
- result == 3:
 -> defeat
- result == 2:
 -> queen_battle
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("missile_decoy")} [Disperse the duplicate with Magic Missile. (Costs 1 charge; take 1 fixed damage.) # action:missile_decoy]
~ result = act("missile_decoy")
{
- result == 3:
 -> defeat
- result == 2:
 -> queen_battle
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}

=== queen_battle ===
# scene:queen_battle
With both spell charges spent, Liora fights with lashes of slime. She has 12 HP and AC 11. Each surviving counterattack deals 2 fixed damage. Defeat her to break the village’s bond, or withdraw while you can.
+ {available("queen_battle_attack")} [Attack the Slime Queen with your weapon. (4 fixed damage; AC 11) # action:queen_battle_attack]
~ result = act("queen_battle_attack")
{
- result == 3:
 -> defeat
- result == 2:
 -> freedom
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("queen_battle_guiding_bolt")} [Cast Guiding Bolt. (8 fixed damage; AC 11) # action:queen_battle_guiding_bolt]
~ result = act("queen_battle_guiding_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> freedom
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("queen_battle_shocking_grasp")} [Cast Shocking Grasp. (5 fixed damage; AC 11) # action:queen_battle_shocking_grasp]
~ result = act("queen_battle_shocking_grasp")
{
- result == 3:
 -> defeat
- result == 2:
 -> freedom
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("queen_battle_magic_missile")} [Cast Magic Missile. (Automatic 5 fixed damage) # action:queen_battle_magic_missile]
~ result = act("queen_battle_magic_missile")
{
- result == 3:
 -> defeat
- result == 2:
 -> freedom
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("queen_battle_giant")} [Grow for one empowered strike. (CON DC 11; 8 fixed damage) # action:queen_battle_giant]
~ result = act("queen_battle_giant")
{
- result == 3:
 -> defeat
- result == 2:
 -> freedom
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("queen_battle_illusory_duplicate")} [Attack behind a duplicate. (WIS DC 11; 4 fixed damage; block response) # action:queen_battle_illusory_duplicate]
~ result = act("queen_battle_illusory_duplicate")
{
- result == 3:
 -> defeat
- result == 2:
 -> freedom
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("queen_battle_ward")} [Cast Shield of Faith. (Block the next damaging event here.) # action:queen_battle_ward]
~ result = act("queen_battle_ward")
{
- result == 3:
 -> defeat
- result == 2:
 -> queen_battle
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("sleep_queen")} [Cast Sleep for one opening. (INT DC 12; 4 fixed damage; prevent response; once) # action:sleep_queen]
~ result = act("sleep_queen")
{
- result == 3:
 -> defeat
- result == 2:
 -> freedom
- result == 1:
 -> queen_battle
- else:
 -> queen_battle
}
+ {available("queen_retreat")} [Retreat through the wedged sanctuary door. # action:queen_retreat]
~ result = act("queen_retreat")
{
- result == 3:
 -> defeat
- result == 2:
 -> withdrawal
- result == 1:
 -> withdrawal
- else:
 -> withdrawal
}

=== marshal ===
# scene:marshal
Marshal Orlan meets you in Valeglass. He sees the queen’s cloak and raises his staff. He refuses to abandon the villagers. You can still withdraw rather than attack. If you fight, his first response will be an 8-fixed-damage Guiding Bolt. Prepare or interrupt it before trading blows.
+ {available("face_bolt")} [Face the opening spell. # action:face_bolt]
~ result = act("face_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_bolt
- result == 1:
 -> marshal_bolt
- else:
 -> marshal_bolt
}
+ {available("leave_cloak")} [Withdraw from the confrontation. # action:leave_cloak]
~ result = act("leave_cloak")
{
- result == 3:
 -> defeat
- result == 2:
 -> withdrawal
- result == 1:
 -> withdrawal
- else:
 -> withdrawal
}

=== marshal_bolt ===
# scene:marshal_bolt
Orlan’s staff shines: Guiding Bolt is coming. This authored encounter uses a Dexterity defense check against DC 11, not a separate hidden enemy attack roll. Failure takes 8 fixed damage. A successful magical interruption avoids the bolt.
+ {available("dodge_bolt")} [Dive behind the fountain. (DEX / Acrobatics, DC 11; failure: 8 fixed damage) # action:dodge_bolt]
~ result = act("dodge_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_missile
- result == 1:
 -> marshal_missile
- else:
 -> marshal_missile
}
+ {available("illusory_duplicate_bolt")} [Cast Illusory Duplicate. (WIS DC 10; failure: 8 fixed damage) # action:illusory_duplicate_bolt]
~ result = act("illusory_duplicate_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_missile
- result == 1:
 -> marshal_missile
- else:
 -> marshal_missile
}
+ {available("command_bolt")} [Cast Command. (WIS DC 11; failure: 8 fixed damage) # action:command_bolt]
~ result = act("command_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_missile
- result == 1:
 -> marshal_missile
- else:
 -> marshal_missile
}
+ {available("ward_bolt")} [Cast Shield of Faith. (Block the 8-damage bolt.) # action:ward_bolt]
~ result = act("ward_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_missile
- result == 1:
 -> marshal_missile
- else:
 -> marshal_missile
}

=== marshal_missile ===
# scene:marshal_missile
Orlan spends his final spell charge on Magic Missile. The bolts seek you around ordinary cover and deal 5 fixed damage. A successful duplicate or Command can stop this particular volley; a ward can absorb it. You can also endure it if you have enough health.
+ {available("endure_missiles")} [Endure the volley. (5 fixed damage.) # action:endure_missiles]
~ result = act("endure_missiles")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_battle
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("illusory_duplicate_missiles")} [Cast Illusory Duplicate. (WIS DC 10; failure: 5 fixed damage) # action:illusory_duplicate_missiles]
~ result = act("illusory_duplicate_missiles")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_battle
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("command_missiles")} [Cast Command. (WIS DC 11; failure: 5 fixed damage) # action:command_missiles]
~ result = act("command_missiles")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_battle
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("ward_missiles")} [Cast Shield of Faith. (Block the 5-damage volley.) # action:ward_missiles]
~ result = act("ward_missiles")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_battle
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}

=== marshal_battle ===
# scene:marshal_battle
Orlan’s two spell charges are spent. He fights with his staff: 12 HP, AC 11, and 1 fixed damage per surviving counterattack. The villagers watch from behind closed doors. Winning this fight gives the queen the unopposed village she demanded.
+ {available("marshal_battle_attack")} [Attack the Guild Marshal with your weapon. (4 fixed damage; AC 11) # action:marshal_battle_attack]
~ result = act("marshal_battle_attack")
{
- result == 3:
 -> defeat
- result == 2:
 -> embrace
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("marshal_battle_guiding_bolt")} [Cast Guiding Bolt. (8 fixed damage; AC 11) # action:marshal_battle_guiding_bolt]
~ result = act("marshal_battle_guiding_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> embrace
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("marshal_battle_shocking_grasp")} [Cast Shocking Grasp. (5 fixed damage; AC 11) # action:marshal_battle_shocking_grasp]
~ result = act("marshal_battle_shocking_grasp")
{
- result == 3:
 -> defeat
- result == 2:
 -> embrace
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("marshal_battle_magic_missile")} [Cast Magic Missile. (Automatic 5 fixed damage) # action:marshal_battle_magic_missile]
~ result = act("marshal_battle_magic_missile")
{
- result == 3:
 -> defeat
- result == 2:
 -> embrace
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("marshal_battle_giant")} [Grow for one empowered strike. (CON DC 11; 8 fixed damage) # action:marshal_battle_giant]
~ result = act("marshal_battle_giant")
{
- result == 3:
 -> defeat
- result == 2:
 -> embrace
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("marshal_battle_illusory_duplicate")} [Attack behind a duplicate. (WIS DC 11; 4 fixed damage; block response) # action:marshal_battle_illusory_duplicate]
~ result = act("marshal_battle_illusory_duplicate")
{
- result == 3:
 -> defeat
- result == 2:
 -> embrace
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("marshal_battle_ward")} [Cast Shield of Faith. (Block the next damaging event here.) # action:marshal_battle_ward]
~ result = act("marshal_battle_ward")
{
- result == 3:
 -> defeat
- result == 2:
 -> marshal_battle
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("command_opening")} [Command: Halt, then strike. (WIS DC 11; 4 fixed damage; prevent response) # action:command_opening]
~ result = act("command_opening")
{
- result == 3:
 -> defeat
- result == 2:
 -> embrace
- result == 1:
 -> marshal_battle
- else:
 -> marshal_battle
}
+ {available("marshal_retreat")} [Break away and abandon the queen’s demand. # action:marshal_retreat]
~ result = act("marshal_retreat")
{
- result == 3:
 -> defeat
- result == 2:
 -> withdrawal
- result == 1:
 -> withdrawal
- else:
 -> withdrawal
}

=== freedom ===
# scene:freedom
The mountain spring releases its hold. In Valeglass, the membranes loosen and people find their own voices. Some weep for the warmth they lost; others run into waiting arms. No one has to agree about the queen to be free of her. You return with a village that can choose for itself.
-> END

=== embrace ===
# scene:embrace
Orlan falls, and green light flows through Valeglass. Liora welcomes you as her champion. The villagers no longer age inside her cloak, and the chorus says they are loved. The road out remains open in stone, but not in her promise. You have won the queen’s victory. Whether it was the village’s is another question.
-> END

=== withdrawal ===
# scene:withdrawal
You leave the confrontation alive. The queen still holds the village’s future, and your commission remains unfinished. Retreat is an outcome, not a secret victory. You may start a new journey with another plan.
-> END

=== defeat ===
# scene:defeat
You cannot continue the fight. Your health is gone, and the village’s fate passes beyond this attempt. Your choices and honest rolls remain in the journal. Start a fresh run to try another approach.
-> END
