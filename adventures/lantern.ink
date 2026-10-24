VAR result = 0
EXTERNAL available(id)
EXTERNAL act(id)
EXTERNAL flag(id)
-> arrival

=== arrival ===
# scene:arrival
Rain drums on the rooftops of Lowwater. A floodgate has jammed upstream, and its keeper has not returned. Mara, the village carpenter, asks you to bring back the signal lantern from the old pump house. Its light will show the rescue boats a safe route. You have one evening, a sturdy weapon, and whatever talents you brought.
+ {available("accept")} [Take the uphill path. # action:accept]
~ result = act("accept")
{
- result == 3:
 -> defeat
- result == 2:
 -> watchpost
- result == 1:
 -> watchpost
- else:
 -> watchpost
}

=== watchpost ===
# scene:watchpost
At the watchpost, a frightened keeper clings to a brake chain. His barking hound blocks the narrow stair. He fears that releasing his grip will flood the village, but the chain merely locks the maintenance door. You can calm him, distract the hound, or climb around the building.
+ {available("sleep_hound")} [Cast Sleep on the hound. # action:sleep_hound]
~ result = act("sleep_hound")
{
- result == 3:
 -> defeat
- result == 2:
 -> archive
- result == 1:
 -> archive
- else:
 -> watchpost
}
+ {available("command_keeper")} [Use Command: release the chain. # action:command_keeper]
~ result = act("command_keeper")
{
- result == 3:
 -> defeat
- result == 2:
 -> archive
- result == 1:
 -> archive
- else:
 -> watchpost
}
+ {available("reassure")} [Explain the brake mechanism calmly. # action:reassure]
~ result = act("reassure")
{
- result == 3:
 -> defeat
- result == 2:
 -> archive
- result == 1:
 -> archive
- else:
 -> detour
}
+ {available("climb")} [Climb around the watchpost. # action:climb]
~ result = act("climb")
{
- result == 3:
 -> defeat
- result == 2:
 -> archive
- result == 1:
 -> archive
- else:
 -> archive
}

=== detour ===
# scene:detour
The longer route costs precious time, but the hillside is passable. You arrive at a low window into the old archive. Nobody needs magic to get through this way.
+ {available("window")} [Enter the archive. # action:window]
~ result = act("window")
{
- result == 3:
 -> defeat
- result == 2:
 -> archive
- result == 1:
 -> archive
- else:
 -> archive
}

=== archive ===
# scene:archive
An old flood-control diagram covers the archive wall. Its labels are in an unfamiliar language. A sketch shows a brass guardian, three levers, and a lantern. Understanding the markings could help you avoid danger below.
+ {available("read_magic")} [Cast Comprehend Languages on the diagram. # action:read_magic]
~ result = act("read_magic")
{
- result == 3:
 -> defeat
- result == 2:
 -> spillway
- result == 1:
 -> spillway
- else:
 -> spillway
}
+ {available("decipher")} [Compare the drawings and mechanisms. # action:decipher]
~ result = act("decipher")
{
- result == 3:
 -> defeat
- result == 2:
 -> spillway
- result == 1:
 -> spillway
- else:
 -> spillway
}
+ {available("skip_diagram")} [Leave the diagram and follow the channel. # action:skip_diagram]
~ result = act("skip_diagram")
{
- result == 3:
 -> defeat
- result == 2:
 -> spillway
- result == 1:
 -> spillway
- else:
 -> spillway
}

=== spillway ===
# scene:spillway
The spillway is collapsing. Falling stones strike the only direct crossing. A protective spell could shelter you; otherwise you can time your dash or use a longer maintenance tunnel.
+ {available("ward_crossing")} [Cast Shield of Faith and cross. # action:ward_crossing]
~ result = act("ward_crossing")
{
- result == 3:
 -> defeat
- result == 2:
 -> chamber
- result == 1:
 -> chamber
- else:
 -> chamber
}
+ {available("dash_crossing")} [Time a dash between falling stones. # action:dash_crossing]
~ result = act("dash_crossing")
{
- result == 3:
 -> defeat
- result == 2:
 -> chamber
- result == 1:
 -> chamber
- else:
 -> chamber
}
+ {available("tunnel")} [Take the slower maintenance tunnel. # action:tunnel]
~ result = act("tunnel")
{
- result == 3:
 -> defeat
- result == 2:
 -> chamber
- result == 1:
 -> chamber
- else:
 -> chamber
}

=== chamber ===
# scene:chamber
The signal lantern glows behind a brass guardian. Its cracked voice repeats: “Unauthorized release.” You can use the sequence, disable its mechanism, fight, or find a bypass. The warden has 12 HP and AC 12. Its counterattack rolls 1d4 + 1 damage.
+ {available("sequence")} [Perform the safe sequence. # action:sequence]
~ result = act("sequence")
{
- result == 3:
 -> defeat
- result == 2:
 -> lantern
- result == 1:
 -> lantern
- else:
 -> lantern
}
+ {available("disable")} [Disconnect the warden’s drive chain. # action:disable]
~ result = act("disable")
{
- result == 3:
 -> defeat
- result == 2:
 -> lantern
- result == 1:
 -> lantern
- else:
 -> chamber
}
+ {available("melee")} [Attack with your starting weapon. # action:melee]
~ result = act("melee")
{
- result == 3:
 -> defeat
- result == 2:
 -> lantern
- result == 1:
 -> chamber
- else:
 -> chamber
}
+ {available("guiding_bolt")} [Cast Guiding Bolt. # action:guiding_bolt]
~ result = act("guiding_bolt")
{
- result == 3:
 -> defeat
- result == 2:
 -> lantern
- result == 1:
 -> chamber
- else:
 -> chamber
}
+ {available("shocking_grasp")} [Cast Shocking Grasp. # action:shocking_grasp]
~ result = act("shocking_grasp")
{
- result == 3:
 -> defeat
- result == 2:
 -> lantern
- result == 1:
 -> chamber
- else:
 -> chamber
}
+ {available("magic_missile")} [Cast Magic Missile. # action:magic_missile]
~ result = act("magic_missile")
{
- result == 3:
 -> defeat
- result == 2:
 -> lantern
- result == 1:
 -> chamber
- else:
 -> chamber
}
+ {available("ward_battle")} [Cast Shield of Faith before your next attack. # action:ward_battle]
~ result = act("ward_battle")
{
- result == 3:
 -> defeat
- result == 2:
 -> chamber
- result == 1:
 -> chamber
- else:
 -> chamber
}
+ {available("bypass")} [Retreat and use the inspection passage. # action:bypass]
~ result = act("bypass")
{
- result == 3:
 -> defeat
- result == 2:
 -> lantern
- result == 1:
 -> lantern
- else:
 -> lantern
}

=== lantern ===
# scene:lantern
You lift the signal lantern from its cradle. Beyond its cage, a manual wheel opens the floodgate. The mechanism is stiff, but a long lever beside it lets you move it without a strength check. The water begins to drain.
+ {available("release")} [Open the floodgate and carry the lantern home. # action:release]
~ result = act("release")
{
- result == 3:
 -> defeat
- result == 2:
 -> home
- result == 1:
 -> home
- else:
 -> home
}

=== home ===
# scene:home
{flag("late"):By the time your lantern shines over Lowwater, the lowest cellars have flooded. Your warning guides the remaining rescue boats safely home.|Your lantern shines over Lowwater before the flood reaches its lowest houses. The rescue boats follow your warning and everyone gets clear.} You opened the floodgate and returned with the signal. Your choices, injuries, and spent charges remain in the journal.
-> END

=== defeat ===
# scene:defeat
Your strength gives out. The rescue crew finds you and carries you to shelter, but you cannot finish the mission tonight. This is a genuine failed attempt, not a secretly adjusted roll. Start a new adventure run to try another approach.
-> END
