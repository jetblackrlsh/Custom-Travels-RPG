import json
from pathlib import Path
p=Path(__file__).resolve().parents[1]
m=dict(id='the-slime-queens-offer',version=1,title='The Slime Queen’s Offer',summary='A Heroes Guild commission leads to a village inside living slime, a mountain sanctuary, and an offer of endless love. Choose whether to free the villagers or accept the Slime Queen’s gift. Includes Giant and Illusory Duplicate, nine supported abilities, and nonmagical routes.',entry='guild',supportedAbilities=['guiding_bolt','shocking_grasp','magic_missile','shield_of_faith','command','sleep','comprehend_languages','giant','illusory_duplicate'],nodes={},actions={},enemies={'membrane':{'name':'Possessing slime membrane','hp':8,'ac':10},'queen':{'name':'Slime Queen','hp':12,'ac':11},'marshal':{'name':'Guild Marshal','hp':12,'ac':11}})
def node(id,title,text,bg='medieval-village'):
 m['nodes'][id]={'title':title,'text':text,'background':bg,'actions':[]}
def action(scene,id,label,target=None,**kw):
 target=target or scene
 a={'label':label,'success':target,'failure':target,'victory':target,'defeat':'defeat'};a.update(kw);m['actions'][id]=a;m['nodes'][scene]['actions'].append(id)
def check(a,dc,prof=None):
 return {'ability':a,'dc':dc,**({'proficiency':prof} if prof else {})}
node('guild','The Commission','The Heroes Guild sends you to the village of Valeglass. Green slime has crept down from a mountain spring. Marshal Orlan asks you to find the missing residents and stop the source. He offers no reward for killing the villagers: bring them home, if you can.')
action('guild','accept','Accept the commission and travel to Valeglass.','village')
node('village','Someone Inside','A translucent shape crosses the square. Inside it is a woman, walking with her eyes open and her hands pressed against the membrane. A baker recognizes her as his sister Mira. Her voice emerges with a chorus behind it: We are loved. Her fingers keep scratching toward the sunlight.')
action('village','approach','Approach the moving membrane carefully.','membrane')
action('village','observe','Watch its movements before approaching. (WIS / Perception, DC 10)','membrane',check=check('WIS',10,'Perception'),flag='saw_mira',successText='You see Mira pull against the slime. Whatever she feels, she is not moving freely.',failureText='The shifting surface hides her expression. You still know a person is inside.')
node('membrane','Free Mira','The slime lashes at anyone who reaches for Mira. Cut or disrupt the outer membrane, not the woman inside it. Its AC is 10 and it has 8 HP. Each surviving response deals 1 fixed damage.')
def combat(scene,enemy,target,damage=4,ret=1):
 ac=m['enemies'][enemy]['ac']
 action(scene,scene+'_attack',f'Attack the {m["enemies"][enemy]["name"]} with your weapon. ({damage} fixed damage; AC {ac})',scene,enemy=enemy,damage=damage,retaliation=ret,check={'ability':'weapon','proficiency':'weapon','dc':ac,'targetType':'AC'},victory=target,successText='Your weapon strikes the intended target.',failureText='Your strike misses; the enemy responds.')
 for sid,ability,dmg in [('guiding_bolt','WIS',8),('shocking_grasp','INT',5),('magic_missile',None,5),('giant','CON',8),('illusory_duplicate','WIS',4)]:
  q={} if ability is None else {'check':dict(ability=ability,dc=11 if sid in ['giant','illusory_duplicate'] else ac,targetType='DC' if sid in ['giant','illusory_duplicate'] else 'AC')}
  label={'giant':'Grow for one empowered strike. (CON DC 11; 8 fixed damage)','illusory_duplicate':'Attack behind a duplicate. (WIS DC 11; 4 fixed damage; block response)','magic_missile':'Cast Magic Missile. (Automatic 5 fixed damage)'}.get(sid,'Cast '+sid.replace('_',' ').title()+f'. ({dmg} fixed damage; AC {ac})')
  action(scene,scene+'_'+sid,label,scene,spell=sid,enemy=enemy,damage=dmg,retaliation=ret,victory=target,successText='The spell takes effect.' if sid!='giant' else 'For this one strike you tower above the enemy: 4 base plus 4 bonus fixed damage. You immediately return to normal size.',failureText='The spell fails. Its charge is spent, and the enemy responds.',suppressRetaliation=sid=='illusory_duplicate',**q)
 action(scene,scene+'_ward','Cast Shield of Faith. (Block the next damaging event here.)',scene,spell='shield_of_faith',successText='A ward forms. It expires when you leave this encounter.')
combat('membrane','membrane','mira')
action('membrane','sleep_membrane','Cast Sleep on the living slime. (INT DC 11)','mira',spell='sleep',check=check('INT',11),failure='membrane',failureDamage=1,successText='The living membrane goes slack. Mira crawls out before it wakes.',failureText='The slime resists and lashes you for 1 fixed damage.')
action('membrane','retreat_membrane','Retreat and guide the baker away from the square.','path',successText='Mira remains inside the slime. You can still stop the source on the mountain.')
node('mira','A Voice of Her Own','Mira falls free. She says the warmth inside was real, but so was her wish to leave. The baker binds your wounds with clean cloth and gives you water. She points to the mountain: the queen lives where the spring begins.')
action('mira','bandage','Accept first aid. (Restore 2 HP once.)','path',heal=2,once=True,flag='mira_free')
node('path','The Mountain Is Still a Mountain','The sanctuary stands on a high shelf. A steep goat trail winds around it. A sealed lift once connected the village to the shelf; its counterweight rope is still intact. You can climb, repair the lift, or briefly grow large enough to step onto the shelf.','mountain-pass')
action('path','giant_step','Cast Giant and step onto the shelf. (CON DC 11)','gate',spell='giant',check=check('CON',11),failure='trail',successText='The mountain becomes a ledge for a moment. You step up and shrink safely on the shelf.',failureText='You cannot sustain the growth. The charge is spent; you take the trail instead.')
action('path','repair_lift','Repair the lift. (INT / Tinker’s Tools, DC 11)','gate',check=check('INT',11,"Tinker's Tools"),failure='trail',successText='The repaired counterweight carries you to the shelf.',failureText='The gears will not hold. You abandon the lift and use the trail.')
action('path','take_trail','Take the longer goat trail.','trail')
node('trail','The Warm Stream','Halfway up, a stream of warm slime crosses the trail. A young goat is trapped on an island of dry stone. Rescue it, leap across, or follow the bank to a safe ford. The ford takes longer but costs no health.','mountain-pass')
action('trail','safe_ford','Follow the bank to the safe ford.','gate')
action('trail','goat_command','Command the goat to leap toward you. (WIS DC 10)','gate',spell='command',check=check('WIS',10),failure='gate',flag='goat_saved',successText='The goat leaps into your arms. You carry it to safe ground.',failureText='The goat freezes. You lead it toward the ford instead; the charge is spent.')
action('trail','goat_rescue','Lay your cloak across the stones and rescue the goat. (DEX / Acrobatics, DC 10)','gate',check=check('DEX',10,'Acrobatics'),failureDamage=1,flag='goat_saved',successText='You bring the goat across with you.',failureText='You slip and take 1 fixed damage, then retreat to the ford. The goat finds a dry route behind you.')
node('gate','Two Places at Once','Two pressure plates flank the sanctuary door. Both must be pressed at once. A stone cart lies nearby, and a carved inscription runs around the threshold. Your magical duplicate can briefly exert enough force on a plate in this adventure.','ancient-temple')
action('gate','read_inscription','Cast Comprehend Languages on the threshold.','inscription',spell='comprehend_languages',once=True,flag='covenant_read')
action('gate','duplicate_gate','Cast Illusory Duplicate on the second plate. (WIS DC 10)','audience',spell='illusory_duplicate',check=check('WIS',10),failure='gate',successText='Your double presses the second plate. You enter before it fades.',failureText='The double flickers before it can hold the plate. Nothing opens.')
action('gate','cart_gate','Roll the stone cart onto one plate and stand on the other.','audience',successText='The counterbalanced door opens. You wedge it with the cart before stepping through.')
node('inscription','The Original Covenant','The inscription promises refuge to willing travelers, and a road home for anyone who wishes to leave. Beneath it, a newer layer of slime covers the word willing. You now have a concrete question to put to the queen, not proof of what she will answer.','ancient-temple')
action('inscription','back_to_gate','Return to the pressure plates.','gate')
node('audience','The Slime Queen','A woman of luminous green slime rises from the spring. She calls herself Queen Liora. She claims her cloak grants overwhelming love and an undead life that never ends through aging. She offers you Illusory Duplicate and Command if you join her and defeat Marshal Orlan, allowing her to spread through Valeglass. You have not accepted anything yet.','ancient-temple')
action('audience','ask_freedom','Ask whether someone can choose to leave her love.','answer')
action('audience','cite_covenant','Show her the covenant’s promise of a road home.','answer',requiresFlag='covenant_read')
action('audience','choose_side','Consider the two paths.','decision')
node('answer','Love Without an Exit','Liora says anyone who truly feels her love would never want to leave. You ask about those who do. She calls that desire a wound she can heal by holding them closer. She may believe her promise, but she will not offer an exit.','ancient-temple')
action('answer','weigh_answer','Make your decision.','decision')
node('decision','What You Will Permit','Refusing means fighting Liora to break her hold. Accepting means receiving her cloak and fighting the guild that protects the village. This is a choice about other people’s freedom as well as your own. Neither path is chosen for you.','ancient-temple')
action('decision','refuse_queen','Refuse: free the village from the queen’s control.','queen_command',flag='opposed_queen')
action('decision','accept_queen','Accept: join the queen and challenge the guild.','cloak',flag='joined_queen')
node('cloak','The Gift and the Price','Warm green light folds around you. The queen’s chorus joins your thoughts, but you retain your present choices. Her gift provides two adventure-only charges shared between Command and Illusory Duplicate. It does not alter your exported character or refill your personal spell charges. She sends you back to face Marshal Orlan.','ancient-temple')
action('cloak','receive_cloak','Receive the two-charge gift and return to Valeglass.','marshal',once=True,grantBoon={'spells':['command','illusory_duplicate'],'charges':2})
node('queen_command','Her First Charge: Kneel','Liora raises one hand and orders you to kneel. Her voice tightens around your muscles. This uses the first of her two spell charges. Resist now; failure costs this exchange and lets her strike for 2 fixed damage. Her Command will not repeat indefinitely.','ancient-temple')
action('queen_command','resist_command','Resist her Command. (WIS / WIS Saving Throw, DC 11)','queen_double',check=check('WIS',11,'WIS Saving Throw'),failureDamage=2,successText='You stay on your feet and force your way through the command.',failureText='Your knees buckle. She strikes for 2 fixed damage while you recover your will.')
action('queen_command','counter_command','Cast Command: Silence. (WIS DC 11)','queen_double',spell='command',check=check('WIS',11),failureDamage=2,successText='Your command interrupts hers before it takes hold.',failureText='Her voice overpowers yours. You lose the exchange and take 2 fixed damage.')
action('queen_command','shield_command','Cast Shield of Faith while the command takes hold.','queen_double',spell='shield_of_faith',retaliation=2,successText='You kneel, but the ward absorbs her strike. You rise as her voice fades.')
node('queen_double','Her Last Charge: A Second Queen','Liora spends her last charge on a duplicate. Two queens advance. One is a brief decoy, not a second enemy with its own health. It can absorb one attack, including Magic Missile. You can read the ripples beneath them or make it vanish by striking. After this exchange, she has no spell charges left.','ancient-temple')
action('queen_double','read_ripples','Identify the real queen by her ripples. (WIS / Perception, DC 10)','queen_battle',check=check('WIS',10,'Perception'),failureDamage=1,successText='Only one queen disturbs the spring. The unused duplicate fades.',failureText='You hesitate before the decoy. Liora clips you for 1 fixed damage, then the duplicate fades.')
action('queen_double','break_decoy','Strike the decoy. (No enemy damage; take 1 fixed damage.)','queen_battle',retaliation=1,successText='Your strike disperses the decoy. Liora lands a glancing response for 1 fixed damage.')
action('queen_double','missile_decoy','Disperse the duplicate with Magic Missile. (Costs 1 charge; take 1 fixed damage.)','queen_battle',spell='magic_missile',retaliation=1,successText='The bolts strike the magical duplicate and disperse it. This special decoy interaction deals no damage to Liora; her response deals 1 fixed damage.')
node('queen_battle','The Queen Without Her Spells','With both spell charges spent, Liora fights with lashes of slime. She has 12 HP and AC 11. Each surviving counterattack deals 2 fixed damage. Defeat her to break the village’s bond, or withdraw while you can.','ancient-temple')
combat('queen_battle','queen','freedom',ret=2)
action('queen_battle','sleep_queen','Cast Sleep and sever her bond while she rests. (INT DC 14)','freedom',spell='sleep',check=check('INT',14),failure='queen_battle',failureDamage=1,successText='She sleeps. You drain the binding spring into its release channel, breaking her hold without killing her.',failureText='She resists and lashes you for 1 fixed damage.')
action('queen_battle','queen_retreat','Retreat through the wedged sanctuary door.','withdrawal')
node('marshal','The Guild Will Not Step Aside','Marshal Orlan meets you in Valeglass. He sees the queen’s cloak and raises his staff. He refuses to abandon the villagers. You can still withdraw rather than attack. If you fight, his first response will be an 8-fixed-damage Guiding Bolt. Prepare or interrupt it before trading blows.')
action('marshal','face_bolt','Face the opening spell.','marshal_bolt')
action('marshal','leave_cloak','Withdraw from the confrontation.','withdrawal')
node('marshal_bolt','Aimed Radiance','Orlan’s staff shines: Guiding Bolt is coming. This opening bolt requires his Intelligence +2 attack against DC 11 in the ordinary dodge contest represented here by your Dexterity check. The game rolls your defense, not a hidden enemy attack. A failed defense takes 8 fixed damage.')
# Explicit authored defense roll rather than pretending two rolls occur.
m['nodes']['marshal_bolt']['text']='Orlan’s staff shines: Guiding Bolt is coming. This authored encounter uses a Dexterity defense check against DC 11, not a separate hidden enemy attack roll. Failure takes 8 fixed damage. A successful magical interruption avoids the bolt.'
action('marshal_bolt','dodge_bolt','Dive behind the fountain. (DEX / Acrobatics, DC 11; failure: 8 fixed damage)','marshal_missile',check=check('DEX',11,'Acrobatics'),failureDamage=8,successText='The radiant bolt bursts against the fountain instead of you.',failureText='The bolt catches you for 8 fixed damage.')
for sp,abi,dc in [('illusory_duplicate','WIS',10),('command','WIS',11)]:
 action('marshal_bolt',sp+'_bolt','Cast '+sp.replace('_',' ').title()+f'. ({abi} DC {dc}; failure: 8 fixed damage)','marshal_missile',spell=sp,check=check(abi,dc),failureDamage=8,successText='Your spell prevents the bolt from hitting you.',failureText='Your spell fails; the bolt deals 8 fixed damage.')
action('marshal_bolt','ward_bolt','Cast Shield of Faith. (Block the 8-damage bolt.)','marshal_missile',spell='shield_of_faith',retaliation=8,successText='Your ward absorbs the radiant bolt.')
node('marshal_missile','Seeking Force','Orlan spends his final spell charge on Magic Missile. The bolts seek you around ordinary cover and deal 5 fixed damage. A successful duplicate or Command can stop this particular volley; a ward can absorb it. You can also endure it if you have enough health.')
action('marshal_missile','endure_missiles','Endure the volley. (5 fixed damage.)','marshal_battle',retaliation=5,successText='The force bolts strike for 5 fixed damage.')
for sp,dc in [('illusory_duplicate',10),('command',11)]:
 action('marshal_missile',sp+'_missiles','Cast '+sp.replace('_',' ').title()+f'. (WIS DC {dc}; failure: 5 fixed damage)','marshal_battle',spell=sp,check=check('WIS',dc),failureDamage=5,successText='The volley cannot reach you through your spell’s effect.',failureText='Your spell fails and the volley deals 5 fixed damage.')
action('marshal_missile','ward_missiles','Cast Shield of Faith. (Block the 5-damage volley.)','marshal_battle',spell='shield_of_faith',retaliation=5,successText='The force bolts exhaust your ward instead of hurting you.')
node('marshal_battle','The Last Defender','Orlan’s two spell charges are spent. He fights with his staff: 12 HP, AC 11, and 1 fixed damage per surviving counterattack. The villagers watch from behind closed doors. Winning this fight gives the queen the unopposed village she demanded.')
combat('marshal_battle','marshal','embrace')
action('marshal_battle','command_opening','Command: Halt, then strike. (WIS DC 11; 4 fixed damage; prevent response)','marshal_battle',spell='command',check=check('WIS',11),enemy='marshal',damage=4,retaliation=1,suppressRetaliation=True,victory='embrace',successText='He loses this exchange to your command. Your strike deals 4 fixed damage.',failureText='He resists and counters for 1 fixed damage.')
action('marshal_battle','marshal_retreat','Break away and abandon the queen’s demand.','withdrawal')
node('freedom','The Road Home','The mountain spring releases its hold. In Valeglass, the membranes loosen and people find their own voices. Some weep for the warmth they lost; others run into waiting arms. No one has to agree about the queen to be free of her. You return with a village that can choose for itself.')
node('embrace','A Village in Her Arms','Orlan falls, and green light flows through Valeglass. Liora welcomes you as her champion. The villagers no longer age inside her cloak, and the chorus says they are loved. The road out remains open in stone, but not in her promise. You have won the queen’s victory. Whether it was the village’s is another question.')
node('withdrawal','An Unfinished Choice','You leave the confrontation alive. The queen still holds the village’s future, and your commission remains unfinished. Retreat is an outcome, not a secret victory. You may start a new journey with another plan.')
node('defeat','The Journey Ends','You cannot continue the fight. Your health is gone, and the village’s fate passes beyond this attempt. Your choices and honest rolls remain in the journal. Start a fresh run to try another approach.')
action('mira','decline_aid','Thank them and continue without first aid.','path',flag='mira_free')
action('cloak','decline_gift','Continue without accepting the extra spell charges.','marshal')
# Preserve the dream's important long-route encounter, rather than substituting another obstacle.
for aid in list(m['nodes']['trail']['actions']): del m['actions'][aid]
m['nodes']['trail']['actions']=[]
m['nodes']['trail']['title']='The Slime on the Stair'
m['nodes']['trail']['text']='A long stone stair winds around the mountain. Halfway up, another villager stands inside a living slime membrane, blocking the narrow path. Break the 4-HP membrane without striking the person inside. Its AC is 10; each surviving response deals 1 fixed damage. Giant could have bypassed this encounter.'
m['enemies']['stair_slime']={'name':'Stairway slime membrane','hp':4,'ac':10}
combat('trail','stair_slime','gate')
action('trail','trail_command','Command the slime to release its captive. (WIS DC 11)','gate',spell='command',check=check('WIS',11),failure='trail',failureDamage=1,successText='The membrane opens for a moment. The villager escapes and you pass.',failureText='It resists and lashes you for 1 fixed damage.')
action('trail','trail_retreat','Retreat down the mountain.','withdrawal')
m['nodes']['path']['text']='A long stone stair coils around the mountain to the sanctuary at its summit. A trail of green slime runs over its lower steps. You can ascend on foot, or cast Giant to briefly grow large enough to step straight onto the summit.'
m['nodes']['path']['actions'].remove('repair_lift');del m['actions']['repair_lift']
m['actions']['take_trail']['label']='Ascend the winding mountain stair.'
m['enemies']['marshal']['hp']=12
m['nodes']['marshal_battle']['text']=m['nodes']['marshal_battle']['text'].replace('12 HP','12 HP')

m['actions']['sleep_queen'].update(label='Cast Sleep for one opening. (INT DC 12; 4 fixed damage; prevent response; once)',success='queen_battle',failure='queen_battle',check=check('INT',12),enemy='queen',damage=4,retaliation=2,suppressRetaliation=True,victory='freedom',once=True,successText='She briefly sleeps. You cut one binding strand for 4 fixed damage before she wakes; she cannot counter this exchange.',failureText='She resists and lashes you for 2 fixed damage. This opening cannot be retried.')
m['actions']['sleep_queen'].pop('failureDamage',None)
(p/'adventures/slime.manifest.json').write_text(json.dumps(m,indent=2))
# Separate portable examples; do not replace the five core premades.
