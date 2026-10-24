#!/usr/bin/env node
'use strict';
const fs=require('node:fs'),path=require('node:path'),{Game,validateCharacter}=require('./src/engine'),C=require('./src/catalog'),validate=require('./src/validate');
const commands={help:0,version:0,catalog:0,premades:0,validate:1,'validate-character':1,start:2,show:1,choose:2};
function fail(code,message){const e=Error(message);e.code=code;throw e;}
function read(p){const st=fs.statSync(p);if(st.size>5*1024*1024)fail('INPUT_TOO_LARGE','Input exceeds 5 MiB');return JSON.parse(fs.readFileSync(p,'utf8'));}
function write(p,v,exclusive=false){if(exclusive&&fs.existsSync(p))fail('SAVE_EXISTS','Start refuses to overwrite an existing save');const tmp=p+'.'+process.pid+'.tmp';try{fs.writeFileSync(tmp,JSON.stringify(v,null,2),{flag:'wx'});if(exclusive){fs.linkSync(tmp,p);fs.unlinkSync(tmp);}else fs.renameSync(tmp,p);}finally{if(fs.existsSync(tmp))fs.unlinkSync(tmp);}}
try{
 const [cmd='help',...args]=process.argv.slice(2);if(!Object.hasOwn(commands,cmd))fail('USAGE','Unknown command: '+cmd);
 const min=commands[cmd],max=['start','show','choose'].includes(cmd)?min+1:min;if(args.length<min||args.length>max)fail('USAGE','Wrong argument count; run help');
 let result;
 if(cmd==='help')result={name:'Custom Travels RPG',commands:{help:'help',version:'version',catalog:'catalog',premades:'premades',validate:'validate ADVENTURE.ctrpg','validate-character':'validate-character CHARACTER.json',start:'start CHARACTER.json|- NEW_SAVE.json [ADVENTURE.ctrpg]',show:'show SAVE.json [ADVENTURE.ctrpg]',choose:'choose SAVE.json ACTION_ID [ADVENTURE.ctrpg]'},stdout:'One JSON value per successful command',stderr:'JSON error on failure; startup notice on start',concurrency:'One writer per save file'};
 else if(cmd==='version')result={name:'Custom Travels RPG',version:require('./package.json').version,characterFormat:1,saveFormat:1};
 else if(cmd==='catalog')result=C;
 else if(cmd==='premades')result=C.premades;
 else if(cmd==='validate'){result=validate(read(args[0]));process.exitCode=result.valid?0:1;}
 else if(cmd==='validate-character'){validateCharacter(read(args[0]));result={valid:true};}
 else{const ap=(cmd==='start'?args[2]:cmd==='choose'?args[2]:args[1])||path.join(__dirname,'adventures/default.ctrpg');const pack=read(ap),report=validate(pack);if(!report.valid)fail('INVALID_ADVENTURE',report.errors.join('; '));let g;if(cmd==='start'){if(fs.existsSync(args[1]))fail('SAVE_EXISTS','Start refuses to overwrite an existing save');g=new Game(pack,args[0]==='-'?C.premades[0]:read(args[0]));write(args[1],g.save(),true);console.error('Custom Travels RPG · SRD-inspired solo adventures');}else{g=Game.restore(pack,read(args[0]));if(cmd==='choose'){g.choose(args[1]);write(args[0],g.save());}}result=g.view();}
 console.log(JSON.stringify(result,null,2));
}catch(e){console.error(JSON.stringify({error:{code:e.code||'INVALID_INPUT',message:e.message}}));process.exitCode=e.code==='USAGE'?2:1;}
