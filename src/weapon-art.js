/* Original, editable weapon artwork for the bounded character catalog.
   Cosmetic silhouettes and poses only: no construction details or new mechanics. */
(function(root){'use strict';
const S=root.Studio,P=root.StudioPuppet2D;
const metal='#c4d8df',wood='#926348',dark='#33465c',gold='#d9ae59';
const shape=(tag,attrs)=>({tag,attrs});
const line=(x1,y1,x2,y2,color=wood,width=6)=>shape('line',{x1,y1,x2,y2,stroke:color,'stroke-width':width,'stroke-linecap':'round'});
const path=(d,fill=metal,stroke=dark,width=2)=>shape('path',{d,fill,stroke,'stroke-width':width,'stroke-linejoin':'round'});
const rect=(x,y,width,height,fill=wood)=>shape('rect',{x,y,width,height,fill,rx:2,stroke:dark,'stroke-width':2});
const oval=(cx,cy,rx,ry,fill=metal)=>shape('ellipse',{cx,cy,rx,ry,fill,stroke:dark,'stroke-width':2});
const definitions={};
function add(name,family,shapes,scale=.72){definitions[name]={name,family,shapes,scale};}
function blade(length,width){return [rect(-4,-12,8,30),rect(-18,15,36,5,gold),path(`M -${width} 20 L -${width} ${length-15} L 0 ${length} L ${width} ${length-15} L ${width} 20 Z`)];}
function spear(length,width=10){return [line(0,-55,0,length-25),path(`M -${width} ${length-30} L 0 ${length} L ${width} ${length-30} Z`)];}
function axe(length,size,double=false){return [line(0,-15,0,length),path(`M 3 ${length-size} Q ${size*1.6} ${length-size*1.5} ${size*1.4} ${length} Q ${size*.6} ${length-size*.1} 3 ${length-10} Z`),...(double?[path(`M -3 ${length-size} Q -${size*1.6} ${length-size*1.5} -${size*1.4} ${length} Q -${size*.6} ${length-size*.1} -3 ${length-10} Z`)]:[])];}
function hammer(length,size){return [line(0,-15,0,length),rect(-size,length-24,size*2,23,metal),rect(-6,length-30,12,35,gold)];}
add('Club','swing',[path('M -5 -15 L -10 18 Q -24 72 -14 90 Q 0 104 14 90 Q 24 72 10 18 L 5 -15 Z',wood)]);
add('Greatclub','heavy',[path('M -7 -25 L -12 25 Q -35 90 -20 128 Q 0 145 20 128 Q 35 90 12 25 L 7 -25 Z',wood),line(-14,60,14,60,dark,5)]);
add('Dagger','thrust',blade(58,9));add('Shortsword','thrust',blade(84,8));add('Longsword','swing',blade(113,8));add('Greatsword','heavy',blade(153,12),.68);
add('Rapier','thrust',[rect(-3,-13,6,30),oval(0,18,19,6,gold),path('M -2 22 L 0 130 L 3 22 Z'),path('M -10 16 Q -27 -10 -4 -13','none',gold,3)]);
add('Scimitar','swing',[...blade(30,6).slice(0,2),path('M -5 20 Q -17 85 25 119 Q 10 73 18 40 L 5 20 Z')]);
add('Handaxe','swing',axe(64,25));add('Battleaxe','swing',axe(103,34));add('Greataxe','heavy',axe(135,42,true),.65);
add('Light Hammer','swing',hammer(62,19));add('Warhammer','swing',hammer(105,28));add('Maul','heavy',hammer(138,40),.65);
add('Mace','swing',[line(0,-15,0,80),oval(0,82,19,27),line(-12,60,-12,102,dark,3),line(0,56,0,108,dark,3),line(12,60,12,102,dark,3)]);
add('Morningstar','swing',[line(0,-15,0,85),path('M 0 49 L 7 65 L 24 57 L 20 75 L 36 84 L 20 92 L 24 110 L 7 103 L 0 120 L -7 103 L -24 110 L -20 92 L -36 84 L -20 75 L -24 57 L -7 65 Z'),oval(0,84,18,18)]);
add('Flail','swing',[line(0,-15,0,60),path('M 0 60 Q 22 68 37 90','none',metal,3),oval(40,103,19,19),line(23,90,17,85,metal,4),line(54,117,60,124,metal,4)]);
add('Quarterstaff','staff',[line(0,-90,0,150,wood,9),line(0,-85,0,-70,metal,9),line(0,130,0,146,metal,9)],.65);
add('Sickle','swing',[line(0,-15,0,55),path('M 0 50 Q 57 51 42 100 Q 36 72 9 78 L 0 70 Z')]);
add('Spear','thrust',spear(145));add('Javelin','throw',spear(112,8));add('Pike','thrust',spear(215,9),.58);
add('Lance','thrust',[line(0,-35,0,22,wood,10),path('M -15 20 L 0 185 L 15 20 Z'),oval(0,19,27,7,gold)],.63);
add('Glaive','staff',[line(0,-65,0,125),path('M -5 105 Q -17 147 13 175 Q 9 139 16 111 Z')],.65);
add('Halberd','staff',[...spear(170),path('M 3 110 Q 55 86 42 151 L 3 137 Z'),path('M -3 114 L -29 126 L -3 136 Z')],.65);
add('Trident','thrust',[line(0,-55,0,130),path('M -24 105 L -24 145 L -32 135 L -24 163 L -16 135 L -22 145 L -22 123 L 22 123 L 22 145 L 16 135 L 24 163 L 32 135 L 24 145 L 24 105','none',metal,4),path('M -7 142 L 0 175 L 7 142 Z')],.67);
add('Whip','swing',[line(0,-15,0,30,dark,8),path('M 0 30 Q 65 49 28 95 Q -2 137 64 149 Q 115 150 87 183','none',wood,4)],.65);
add('Dart','throw',[line(0,-8,0,43,wood,3),path('M -5 35 L 0 57 L 5 35 Z'),path('M -7 -15 L 0 -7 L 7 -15 L 7 4 L 0 10 L -7 4 Z','#ba6c54')]);
function bow(length){return [path(`M -${length} 0 Q 0 51 ${length} 0`,'none',wood,6),line(-length,0,length,0,'#dfd6bb',2),line(-7,24,7,24,dark,8),line(0,-7,0,86,wood,3),path('M -5 79 L 0 94 L 5 79 Z')];}
add('Shortbow','bow',bow(48));add('Longbow','bow',bow(82),.7);
function crossbow(length,width){return [rect(-5,-20,10,length),path(`M -${width} 32 Q 0 6 ${width} 32`,'none',wood,7),path(`M -${width} 32 L 0 -10 L ${width} 32`,'none','#dfd6bb',2),line(0,0,0,length-10,metal,3)];}
add('Hand Crossbow','aim',crossbow(59,27));add('Light Crossbow','aim',crossbow(91,45));add('Heavy Crossbow','long-aim',[...crossbow(118,58),rect(-15,-25,30,15,dark)],.66);
add('Sling','sling',[path('M 0 0 Q -32 34 -13 69 M 2 0 Q 34 34 13 69','none',wood,3),oval(0,70,16,8,wood),oval(0,67,9,6,'#a8aaa2')]);
add('Blowgun','blowgun',[line(0,-10,0,113,wood,8),line(0,98,0,113,gold,8)]);
add('Pistol','aim',[rect(-6,-4,12,59,dark),rect(-5,-17,24,24,wood),line(-5,44,6,44,metal,3),path('M 8 5 Q 28 8 14 24','none',gold,3)]);
add('Musket','long-aim',[path('M -8 -40 L 15 -30 L 12 -2 L 5 38 L -6 38 Z',wood),rect(-5,12,10,130,dark),line(-6,112,6,112,metal,4),path('M 8 -1 Q 29 9 10 21','none',gold,3)],.7);
function info(name){const d=definitions[name];if(!d)throw Error('No artwork for weapon: '+name);return d;}
function build(name,id='weapon') {const d=info(name);let serial=0;const nodes=d.shapes.map(x=>({id:id+'_'+serial++,tag:x.tag,attrs:{...x.attrs},pose:{...S.defaults},keys:[],children:[]}));return {id,tag:'g',attrs:{},pose:{...S.defaults,scaleX:d.scale,scaleY:d.scale},keys:[],children:nodes,library:{role:'prop',kind:'weapon',weapon:name,family:d.family},grip:{side:'R'}};}
const actionFor={swing:'weapon-slash',heavy:'weapon-overhead',staff:'ctrpg-staff',thrust:'ctrpg-thrust',throw:'ctrpg-throw',bow:'ctrpg-bow',aim:'shoot-pistol','long-aim':'shoot-rifle',sling:'ctrpg-sling',blowgun:'ctrpg-blowgun'};
const custom={
 'ctrpg-thrust':u=>({shoulderR:{rotation:-72-18*Math.sin(Math.PI*u)},elbowR:{rotation:-12+12*Math.sin(Math.PI*u)},wristR:{rotation:0},shoulderL:{rotation:15},elbowL:{rotation:-75}}),
 'ctrpg-staff':u=>({shoulderR:{rotation:-75-15*Math.sin(Math.PI*u)},elbowR:{rotation:0},shoulderL:{rotation:-90},elbowL:{rotation:0},torso:{rotation:4*Math.sin(Math.PI*u)}}),
 'ctrpg-bow':u=>({shoulderR:{rotation:-90},elbowR:{rotation:0},wristR:{rotation:0},shoulderL:{rotation:-35},elbowL:{rotation:-130+15*Math.sin(Math.PI*u)}}),
 'ctrpg-throw':u=>({shoulderR:{rotation:-145+65*Math.sin(Math.PI*u)},elbowR:{rotation:-20+20*Math.sin(Math.PI*u)},wristR:{rotation:5},torso:{rotation:8*Math.sin(Math.PI*u)}}),
 'ctrpg-sling':u=>({shoulderR:{rotation:-135+45*Math.sin(Math.PI*u)},elbowR:{rotation:10},wristR:{rotation:80*Math.sin(Math.PI*u)}}),
 'ctrpg-blowgun':u=>({shoulderR:{rotation:-140},elbowR:{rotation:45},wristR:{rotation:5},neck:{rotation:3}})
};
for(const [name,fn] of Object.entries(custom))P.registerAction(name,u=>P.pose({...fn(u),handROpen:{opacity:0},handRFist:{opacity:1}},name),{category:'Custom Travels weapon poses'});
function animate(rig,name){const family=info(name).family;P.clearAnimation(rig);P.applyClip(rig,P.makeClip(actionFor[family],3),0);return rig;}
function attach(rig,name){const prop=build(name,rig.id+'_weapon'),side=info(name).family==='long-aim'?'L':'R',hand=P.joint(rig,'wrist'+side);prop.grip.side=side;if(hand.children.some(n=>n.library?.kind==='weapon'))throw Error('Weapon already attached');prop.grip.puppetId=rig.id;hand.children.unshift(prop);return prop;}
root.CTRPGWeaponArt={names:Object.keys(definitions),info,build,animate,attach};
})(typeof window!=='undefined'?window:globalThis);
