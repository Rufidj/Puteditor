program test;

import "libmod_gfx"
import "libmod_input"
import "libmod_sound"
import "libmod_misc";

include "functions.prg"

global

begin
set_mode(640,480);
tiles=fpg_load("gfx/tiles.fpg");
pinta_mapa("menu.ped",1000);
loop
if(key(_esc));exit("",0);end
frame;
end
end
