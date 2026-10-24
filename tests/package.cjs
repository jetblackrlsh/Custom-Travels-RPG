'use strict';
const fs=require('node:fs'),path=require('node:path'),os=require('node:os'),cp=require('node:child_process'),assert=require('node:assert/strict');
const root=path.resolve(__dirname,'..'),tmp=fs.mkdtempSync(path.join(os.tmpdir(),'ctrpg-package-')),out=path.join(tmp,'game with spaces');
function run(file,args,cwd=tmp){const r=cp.spawnSync(process.execPath,[file,...args],{cwd,encoding:'utf8',timeout:20000});assert.equal(r.status,0,r.stderr);return r.stdout;}
try{run(path.join(root,'package.cjs'),[path.join(root,'adventures/lantern.ctrpg'),out]);assert(!fs.existsSync(path.join(out,'node_modules')));for(const f of ['AGENTS.md','docs/AGENT-QUICKSTART.md','examples/agent-play.cjs','.github/workflows/test.yml'])assert(fs.existsSync(path.join(out,f)),f);
const cli=path.join(out,'cli.cjs'),save=path.join(tmp,'journey.json');const view=JSON.parse(run(cli,['start','-',save]));assert.equal(view.scene,'arrival');run(cli,['choose',save,'accept']);const next=JSON.parse(run(cli,['show',save]));assert.equal(next.scene,'watchpost');assert(JSON.parse(run(path.join(out,'examples/agent-play.cjs'),[])).ended);
const overwrite=cp.spawnSync(process.execPath,[path.join(root,'package.cjs'),path.join(root,'adventures/lantern.ctrpg'),out],{encoding:'utf8'});assert.notEqual(overwrite.status,0);
console.log('PASS fresh distribution, paths with spaces, no node_modules, CLI and agent example, packaging refuses overwrite');
}finally{fs.rmSync(tmp,{recursive:true,force:true})}
