'use strict';
const assert=require('node:assert/strict'),fs=require('node:fs'),C=require('../src/catalog'),{Game,validateCharacter,dice}=require('../src/engine');
const pack=JSON.parse(fs.readFileSync(__dirname+'/../adventures/lantern.ctrpg')),copy=x=>JSON.parse(JSON.stringify(x));let checks=0,characters=0;
function* permutations(xs){if(xs.length===0){yield [];return}for(let i=0;i<xs.length;i++)for(const rest of permutations(xs.slice(0,i).concat(xs.slice(i+1))))yield [xs[i],...rest]}
// Duplicate +2 values mean 360 unique arrays, not 720 distinct builds.
const seen=new Set();for(const arr of permutations(C.array)){if(seen.has(JSON.stringify(arr)))continue;seen.add(JSON.stringify(arr));for(const profile of Object.keys(C.profiles)){const c=copy(C.premades[0]);c.profile=profile;c.proficiencies=[];c.spells=[];C.abilities.forEach((k,i)=>c.stats[k]=arr[i]);validateCharacter(c);characters++;}}
const c=copy(C.premades[0]);c.proficiencies=['Perception'];const g=new Game(pack,c,{testSeed:1});
for(const ability of C.abilities)for(const skill of ['Perception','Stealth'])for(let face=1;face<=20;face++)for(let dc=1;dc<=30;dc++){g.random=()=>face;const r=g.check({ability,proficiency:skill,dc});const total=face+c.stats[ability]+(skill==='Perception'?2:0);assert.equal(r.total,total);assert.equal(r.success,total>=dc);checks++;}
for(const weapon of C.weapons){const ch=copy(c);ch.weapon=weapon;const h=new Game(pack,ch,{testSeed:1});h.random=()=>10;const r=h.check({ability:'weapon',proficiency:'weapon',dc:15,targetType:'AC'});assert.equal(r.proficiencyBonus,2);assert(['STR','DEX'].includes(r.ability));assert.equal(r.total,12+ch.stats[r.ability]);}
for(const f of ['0d6','21d6','1d1','1d101','1d6+100','1d6junk',-1,101,1.1,null,{}])assert.throws(()=>dice(f,()=>1));
assert.equal(dice('20d100+99',()=>100).total,2099);assert.equal(dice('1d2-99',()=>1).total,0);
// Direct mechanics tests isolate damage and state semantics from authored branching.
const h=new Game(pack,C.premades[0],{testSeed:1});h.state.scene='chamber';h.state.ward='chamber';let e={};h.hurt(3,e);assert.equal(h.state.hp,h.state.maxHP);assert.equal(e.blockedDamage,3);h.hurt(4,{});assert.equal(h.state.hp,h.state.maxHP-4);h.hurt(100,{});assert.equal(h.state.hp,0);
// Public snapshots are defensive copies; callers cannot mutate game through view/save.
const j=new Game(pack,C.premades[0]);const v=j.view();v.character.name='changed';v.state.hp=0;assert.notEqual(j.character.name,'changed');assert(j.state.hp>0);const s=j.save();s.state.hp=0;assert(j.state.hp>0);
console.log(JSON.stringify({passed:'rules boundaries, all unique arrays/profiles, all weapons, damage limits, ward, snapshot isolation',characters,checks,weapons:C.weapons.length}));
