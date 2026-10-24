'use strict';
const fs=require('fs'),path=require('path'),assert=require('node:assert/strict'),{JSDOM}=require('jsdom');
const root=path.resolve(__dirname,'..'),dom=new JSDOM(fs.readFileSync(root+'/START.html','utf8'),{runScripts:'outside-only',url:'http://localhost/',pretendToBeVisual:true}),w=dom.window;
w.scrollTo=()=>{};w.requestAnimationFrame=()=>0;w.matchMedia=()=>({matches:true});
for(const s of w.document.querySelectorAll('script[src]'))w.eval(fs.readFileSync(path.join(root,s.getAttribute('src')),'utf8')+(s.getAttribute('src')==='src/app.js'?'\nwindow.testPuppet=puppet;':''));
for(const name of w.CTRPGCatalog.weapons){w.testCharacter=JSON.parse(JSON.stringify(w.CTRPGCatalog.premades[0]));w.testCharacter.weapon=name;const p=w.testPuppet(w.testCharacter,false,'dungeon','warden','weapon-slash');let weapons=[];w.Studio.walk(p.scenes[0].nodes,n=>{if(n.library?.kind==='weapon')weapons.push(n.library.weapon)});assert.deepEqual(weapons,[name]);assert(w.Studio.render(p,1,{captions:false}).includes('<svg'));}
console.log('PASS browser script load order and all 37 generic-adventure weapon adapters in simulated DOM.');dom.window.close();
