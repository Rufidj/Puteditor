program putedit;

import "libmod_gfx"
import "libmod_input"
import "libmod_sound"
import "libmod_misc";

include "functions.prg"

global
int raton;
int opcion=0;


begin
set_fps(0,0);
set_mode(640,480);

tiles=fpg_load("gfx/tiles.fpg");
menu_principal();
pinta_mapa("menu.ped",1000);
 loop
			 if(key(_1));
			 while(key(_1));
			 frame;
			 end
			 opcion=1;
			 end
			 
			 if(key(_2));
			 while(key(_2));
			 frame;
			 end
			 opcion=2;
			 end
			 
			 
			 if(key(_3));
			 while(key(_3));
			 frame;
			 end
			 opcion=3;
			 end
			 
			 
			 if(key(_4));
			 while(key(_4));
			 frame;
			 end
			 opcion=4;
			 end
			        switch(opcion);
			
			        case 1:
					opcion=0;
					write_delete(all_text);
					let_me_alone();
			        cursor();
	                fichero=fopen("levels/mapa.ped",o_write);
					
	            end
			        case 2:	
					write_delete(all_text);
					opcion=0;
					let_me_alone();
			        pincel(mouse.x,mouse.y);
			        pinta_mapa("levels/mapa.ped",1000000000);
			    end
	                case 3:
					write_delete(all_text);
					opcion=0;
					let_me_alone();
					pinta_mapa("levels/mapa.ped",1000);
				end
	                case 4:
					write_delete(all_text);
					opcion=0;
					
					   fclose(fichero);
	                say("Fichero salvado : " + &mapa);
	                exit("",0);
		          end
			   end
           frame;
        end
     end

		  
		  
process cursor();
begin
graph=1;
x=16;
y=16;
                loop
				if(key(_right));
				while(key(_right));
				frame;
				end
				x=x+32;
				end
				if(key(_left));
				while(key(_left));
				frame;
				end
				x=x-32;
				end
			    if(key(_up));
				while(key(_up));
				frame;
				end
				y=y-32;
				end
				if(key(_down));
				while(key(_down));
				frame;
				end
				y=y+32;
				end
				
				
                if(key(_enter));
                while(key(_enter));
             frame;
           end
           put(graph,x,y);
           fputs(fichero,graph);
           fputs(fichero,x);
		   fputs(fichero,y);
       end 
	   if(mouse.wheelup);
	   while(mouse.wheelup);
	   frame;
	   end
	   graph=graph+1;
	   end
	   if(graph=>16);
	   graph=1;
	   end
	   if(mouse.wheeldown);
	   while(mouse.wheeldown);
	   frame;
	   end
	   graph=graph-1;
	   end
	   if(graph=<0);
	   graph=16;
	   end
	   frame;
	end
end	

process pincel(x,y);
private
      byte r=255;
      byte g=74;
      byte b=74;
	  byte a=120;
	  int col;
	  int xp;   // coordenada x del principio
	  int yp;   // coordenada y del principio 
	  int xf;   // coordenada x del final
	  int yf;   // coordenada y del final
	  
begin
      raton=map_load("gfx/mouse.png");
      mouse.graph=raton;
	  z=-255;
	  col=rgba(r,g,b,a);
	  drawing_color(col);
      loop
	  if(mouse.left);
	  while(mouse.left);
	  frame;
	  end
	  xp=mouse.x;
	  yp=mouse.y;
	  end
	  if(mouse.right);
	  while(mouse.right);
	  frame;
	  end
	  xf=mouse.x;
	  yf=mouse.y;
	  draw_line(xp,yp,xf,yf);
	  end
	  if(mouse.wheelup);
	  while(mouse.wheelup);
	  frame;
	  end
	  col=rgb(r++,g++,b++);
	  drawing_color(col);
	  say("Red " +r);
	  say("Green " +g);
	  say("Blue " +b);
	  say("Alpha " +a);
	  end
	  
    frame;
   end
end



process menu_principal();
begin
write(0,280,200,14,"1. Nuevo mapa");
write(0,280,220,14,"2. Editor de durezas");
write(0,280,240,14,"3. Cargar mapa ");
write(0,280,260,14,"4. Salir del editor");
write(0,280,470,14,"Creado por Rufidj en 2019");	 
loop
frame;
end
end
  




	

		
	
	

	

