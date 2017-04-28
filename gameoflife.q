//This is game of life. Web version.
@[system;"p 50602";{-1 "Couldn't open a port"}]
system["S ",1_(string[.z.T]except".:0")]
.space.gen:0

/Start
.z.ws:{
 if["Start"~-9!x;$[.space.gen>0;system"t 150";[.space.main[];system"t 150"]];]; 
 if["Stop"~-9!x;system"t 0";];
 }

.z.wc:{system"t 0";}
.z.pc:{system"t 0";}

.space.genInds:{first each(1?til .space.height;1?til .space.width)}

.space.sendUpd:{[]
 locations:2 cut raze/[{{[yax;xax] $[1=.space.world[yax;xax];(yax;xax);()]}[y;]each til x}[.space.width;]each til .space.height];
 res:.j.j 10+'5*'locations;
 {neg[y](-8!x);}[res;]each key .z.W;
 }

.space.scoreCell:{[line;pos]
 //each cell has eight neighbours
 neighbours:(1 0;1 -1;0 -1;-1 -1;-1 0;-1 1;0 1;1 1);
 //look around for any alive neighbours
 part:(1)={.space.world[x+(z[0]);y+(z[1])]}[line;pos;]each neighbours;
 catalogue:count where part;
 //keep alive if already alive
 if[((catalogue=2)or(catalogue=3))and(.space.world[line;pos]~1);:(line;pos);];
 //create new child if surrounded by 3
 if[catalogue=3;:(line;pos);];
 }

.space.addCritter:{[ws]
 //location of all alive critters
 newlocation:.space.genInds[];
 .[`.space.world;newlocation;:;1];
 }

.space.selection:{[]
 .space.gen+:1;
 survive:{.space.scoreCell[y;]each til x}[.space.width;]each til .space.height;
 survivours:2 cut raze/[survive]except(::);
 //kill the rest
 .space.world:(.space.height;.space.width)#0;
 {.[`.space.world;x;:;1]}each survivours;
 $[.space.gen>.space.maxgen;:();];
 }
 
.space.run:{[]
 .space.gen:0;
 //initialise world
 .space.world:(.space.height;.space.width)#0;
 //add starting population
 {.[`.space.world;.space.genInds[];:;1]}each til .space.sp;
 .space.selection[]; 
 }

.space.main:{[]
 .space.sp:9000;
 .space.maxgen:600;
 .space.generations:distinct 100?til .space.maxgen;
 .space.height:97;
 .space.width:197;
 .space.run[];
 }

.z.ts:{.space.selection[];.space.sendUpd[]}
//.space.main[10000;900]
