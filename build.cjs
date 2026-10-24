const fs=require('fs'),path=require('path'),compile=require('./compile.cjs');
const dir=path.join(__dirname,'adventures');
for(const file of fs.readdirSync(dir).filter(f=>f.endsWith('.manifest.json'))){const stem=file.slice(0,-14),m=JSON.parse(fs.readFileSync(path.join(dir,file))),{source,pack}=compile(m);fs.writeFileSync(path.join(dir,stem+'.ctrpg'),JSON.stringify(pack,null,2));fs.writeFileSync(path.join(dir,stem+'.ink'),source);fs.writeFileSync(path.join(dir,stem+'.js'),'globalThis.CTRPGAdventure='+JSON.stringify(pack)+';\n');console.log('Built '+stem+': '+m.title);}

const packs=["dragon","slime"].map(id=>JSON.parse(fs.readFileSync(path.join(dir,id+".ctrpg"))));fs.writeFileSync(path.join(dir,"library.js"),"globalThis.CTRPGPacks="+JSON.stringify(packs)+";\n");
