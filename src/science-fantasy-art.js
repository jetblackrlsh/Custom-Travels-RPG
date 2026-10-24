/* Original generic code-native SVG creatures and alchemical dressing. */
(function(root){'use strict';
function build(kind){let serial=0;const S=root.Studio;const node=(tag,attrs={},children=[])=>({id:'sf_'+serial++,tag,attrs,pose:{...S.defaults},keys:[],children});const path=(d,fill,stroke='#243342',width=3)=>node('path',{d,fill,stroke,'stroke-width':width,'stroke-linejoin':'round'});const circle=(cx,cy,r,fill)=>node('circle',{cx,cy,r,fill});const out=[];
// Copper conduits and induction apparatus sit behind the figures.
out.push(path('M 70 450 L 70 140 Q 70 110 100 110 L 850 110 L 850 450','none','#876341',12));out.push(path('M 75 445 L 75 145 Q 75 118 105 118 L 843 118','none','#8de2dc',2));
for(const x of [130,460,800])out.push(circle(x,110,12,'#c29b61'),circle(x,110,5,'#8de2dc'));
if(kind.includes('dragon')){
 const god=kind==='dragon-god',col=god?'#669b91':kind==='bronze-dragon'?'#ac8352':'#b7c7dd',mem=god?'#315b66':'#455872';
 const g=node('g',{},[
 path('M 690 340 Q 725 200 830 180 L 792 287 L 865 270 L 807 346 Z',mem),
 path('M 717 333 L 827 184 M 717 333 L 792 287 M 717 333 L 863 273','none',col,4),
 path('M 735 400 Q 861 397 895 330 Q 919 432 793 431 L 730 425 Z',col),
 node('ellipse',{cx:710,cy:370,rx:105,ry:65,fill:col,stroke:'#243342','stroke-width':3}),
 path('M 642 383 Q 574 335 590 270 L 611 252 L 643 267 Q 630 316 690 334 Z',col),
 path('M 598 246 L 630 237 L 655 256 L 635 284 L 578 288 L 563 276 L 577 259 Z',col),
 path('M 618 242 L 630 211 L 639 247 M 640 250 L 662 226 L 654 265','#e4c68d'),
 path('M 650 402 L 635 452 L 601 455 L 617 431 L 616 399 M 758 410 L 780 449 L 736 451 L 742 428',col),
 circle(597,263,5,god?'#a2f2f1':'#ffdf8e'),circle(597,263,2,'#243342'),
 path('M 565 277 L 604 279','none','#243342',2),
 path('M 683 340 L 695 319 L 710 338 L 725 317 L 740 340','#ddc181')]);
 if(god){g.children.push(node('ellipse',{cx:619,cy:213,rx:45,ry:12,fill:'none',stroke:'#e7d594','stroke-width':4}));out.push(path('M 502 461 L 885 461 L 885 486 L 502 486 Z','#48616d'));}out.push(g);
}else if(kind==='homunculi'){
 for(let i=0;i<3;i++){const x=590+i*100,y=365+(i%2)*30;out.push(node('ellipse',{cx:x,cy:y,rx:30,ry:38,fill:'#a69c8c',stroke:'#293b48','stroke-width':3}),circle(x,y-55,25,'#a9d8d8'),circle(x-9,y-58,4,'#f5e6a1'),circle(x+9,y-58,4,'#f5e6a1'),path(`M ${x-25} ${y-12} L ${x-49} ${y+24} M ${x+25} ${y-12} L ${x+48} ${y+20} M ${x-14} ${y+30} L ${x-22} ${y+65} M ${x+14} ${y+30} L ${x+22} ${y+65}`,'none','#b98350',9),circle(x,y,12,'#8ee5d7'));}
}else{
 out.push(node('rect',{x:490,y:425,width:150,height:14,fill:'#755a47'}));
 for(let i=0;i<3;i++){const x=515+45*i;out.push(path(`M ${x-7} 358 L ${x+7} 358 L ${x+7} 380 L ${x+19} 410 Q ${x+19} 422 ${x} 422 Q ${x-19} 422 ${x-19} 410 L ${x-7} 380 Z`,'#90cad3'),circle(x,404,10,['#74cda3','#d99a70','#ba9cdf'][i]));}
 out.push(node('ellipse',{cx:563,cy:343,rx:52,ry:15,fill:'none',stroke:'#c29b61','stroke-width':5}));
}
return out;}
root.CTRPGScienceArt={build};
})(typeof window!=='undefined'?window:globalThis);
