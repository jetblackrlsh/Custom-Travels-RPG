'use strict';
const fs=require('fs'),assert=require('node:assert/strict'),C=require('../src/catalog'),{Game}=require('../src/engine'),validate=require('../src/validate');
const pack=JSON.parse(fs.readFileSync(__dirname+'/../adventures/dragon.ctrpg')),copy=x=>JSON.parse(JSON.stringify(x));
assert(validate(pack).valid);assert.equal(pack.manifest.supportedAbilities.length,7);
function reach(g){for(const id of ['hear_petition','depart','sheltered_stair','leave_pulse','service_passage','take_tonic'])g.choose(id)}
const results={save_god:{},side_alchemist:{}};let runs=0;
for(const c of C.premades)for(const side of ['save_god','side_alchemist'])for(let seed=1;seed<=100;seed++){
 const ch=copy(c);ch.spells=[];const g=new Game(pack,ch,{testSeed:seed});reach(g);g.choose(side);if(side==='side_alchemist')g.choose('hold_door');
 for(let step=0;!g.view().ended&&step<80;step++){const ids=g.view().choices.map(x=>x.id),id=ids.find(x=>x.endsWith('_attack'))||ids.find(x=>['trust_attendants','witness_end'].includes(x));assert(id);g.choose(id);}
 assert(g.view().ended);assert(g.state.log.every(e=>!e.spell));results[side][g.state.scene]=(results[side][g.state.scene]||0)+1;runs++;
}
assert(results.save_god.god_saved>0&&results.side_alchemist.god_dead>0);
// Explicit bad luck produces honest defeat, with different consequences by allegiance.
for(const [side,ending] of [['save_god','rescue_lost'],['side_alchemist','alchemist_lost']]){const g=new Game(pack,C.premades[1],{testSeed:1});reach(g);g.choose(side);if(side==='side_alchemist')g.choose('hold_door');g.random=()=>1;while(!g.view().ended)g.choose(g.view().choices.find(c=>c.id.endsWith('_attack')).id);assert.equal(g.state.scene,ending);assert.equal(g.state.hp,0);}
// Both outcomes of every authored check and all ability uses in mixed exploration.
const seen=new Set(['rescue_lost','alchemist_lost']),actions=new Set(),spells=new Set(),checkOutcomes={};let decisions=0;
for(let seed=1;seed<=4000;seed++){const c=copy(C.premades[seed%5]);c.profile='mystic';c.proficiencies=c.proficiencies.slice(0,3);const ss=Object.keys(C.spells);c.spells=[ss[seed%7],ss[(seed+2)%7],ss[(seed+4)%7]];const g=new Game(pack,c,{testSeed:seed});let rand=seed;
 for(let i=0;!g.view().ended&&i<200;i++){seen.add(g.state.scene);rand=(Math.imul(rand,1664525)+1013904223)>>>0;const choice=g.view().choices[rand%g.view().choices.length];g.choose(choice.id);if(!choice.core)actions.add(choice.id);const e=g.state.log.at(-1);if(e.spell)spells.add(e.spell);if(e.check)(checkOutcomes[e.id]??=new Set()).add(e.check.success);assert(g.state.hp>=0&&g.state.hp<=g.state.maxHP);assert(g.state.charges>=0&&g.state.charges<=g.state.maxCharges);decisions++;}assert(g.view().ended,'loop '+seed);seen.add(g.state.scene);
}
assert.equal(seen.size,Object.keys(pack.manifest.nodes).length);assert.equal(actions.size,Object.keys(pack.manifest.actions).length);assert.equal(spells.size,7);for(const [id,a]of Object.entries(pack.manifest.actions))if(a.check)assert.equal(checkOutcomes[id]?.size,2,'Both check outcomes not visited: '+id);
// Declared loyalty locks the two mutually exclusive lines of action.
for(const [side,forbidden]of [['save_god','side_alchemist'],['side_alchemist','save_god']]){const g=new Game(pack,C.premades[0]);reach(g);g.choose(side);assert.throws(()=>g.choose(forbidden));const s=g.save();assert.deepEqual(Game.restore(pack,s).view(),g.view());}
const report={ordinaryRuns:runs,ordinaryEndings:results,mixedRuns:4000,mixedDecisions:decisions,visitedScenes:seen.size,selectedActions:actions.size,spellsUsed:[...spells],checksWithBothOutcomes:Object.keys(checkOutcomes).length};fs.writeFileSync(__dirname+'/dragon-results.json',JSON.stringify(report,null,2));console.log(JSON.stringify(report));
