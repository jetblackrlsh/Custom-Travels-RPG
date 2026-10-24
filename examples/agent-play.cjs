// No external dependencies. Agent demonstration, not a tactical solver.
'use strict';
const fs=require('node:fs'),path=require('node:path'),{Game}=require('../src/engine'),C=require('../src/catalog');
const pack=JSON.parse(fs.readFileSync(process.argv[2]||path.join(__dirname,'../adventures/default.ctrpg'),'utf8'));
const g=new Game(pack,C.premades[0]);
for(let step=0;step<100;step++){
 const view=g.view();
 if(view.ended){console.log(JSON.stringify({ended:true,scene:view.scene,hp:view.state.hp,decisions:view.state.log.length}));process.exit(0);}
 const choice=view.choices[0];
 if(!choice)throw Error('No legal action in a nonterminal state');
 g.choose(choice.id);
}
throw Error('Agent step limit reached; inspect the story before continuing');
