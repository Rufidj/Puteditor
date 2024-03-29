program putedit;

import "libmod_gfx"
import "libmod_input"
import "libmod_sound"
import "libmod_misc";

include "functions.prg"

global
int raton;
int opcion=0;
int opcion_mapa;
byte bfile;
int pantalla;


begin
          set_fps(0,0);
         // set_mode(800,600,mode_fullscreen);
		    set_mode(800,600);
          tiles=fpg_load("gfx/tiles.fpg");
		  menu_principal();
        loop
             write_var(0,40,40,14,frame_info.fps);
			 	
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
	             if(graph=>93);
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
      int r;
	  int g;
	  int b;
	  int contcolor;
	  
begin
	  r=map_load("gfx/red.png");
	  g=map_load("gfx/green.png");
	  b=map_load("gfx/blue.png");
      mouse.graph=r;
	  z=-255;
	
             loop
	              if(mouse.left);
		          put(mouse.graph,mouse.x,mouse.y);
	 
	  end
	             if(key(_r));
				 while(key(_r));
				 frame;
				 end
				 mouse.graph=r;
				 end
				  if(key(_g));
				 while(key(_g));
				 frame;
				 end
				 mouse.graph=g;
				 end
				 
				  if(key(_b));
				 while(key(_b));
				 frame;
				 end
				 mouse.graph=b;
				 end
				 
				 
	   
	  
    frame;
   end
end


process menu_principal();
begin     
          opcion=0; 
		  let_me_alone();
		  pinta_mapa("menu.ped",1000);
          write_delete(all_text);
          write(0,280,100,14,"1. Nuevo mapa");
          write(0,280,120,14,"2. Editor de durezas");
          write(0,280,140,14,"3. Cargar mapa ");
          write(0,280,160,14,"4. Salir del editor");
          write(0,280,470,14,"Creado por Rufidj en 2019");	
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
					nuevo_mapa();
					
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
					pantalla=screen_get();
					png_save(0,pantalla,"png.png");
					   fclose(fichero);
	                say("Fichero salvado : " + &mapa);
	                exit("",0);
		          end
			   end
           frame;
        end
end


  
process nuevo_mapa();
begin           
                
				write_delete(all_text);
                let_me_alone();
                cursor();       
				if(file_exists("levels/mapa.ped")==true);
				say("el fichero ya existe");
	            //fichero=fopen("levels/mapa.ped",o_readwrite);
				end
				
				loop
				if(key(_esc));
				while(key(_esc));
			frame;
			opcion_mapa=0;
		  end
		        switch(opcion_mapa)
				
				    case 0:
					menu_principal();
				end
			   end
	   end
     frame;
    end	   
end


	



		
	
	

	

