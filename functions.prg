global
int fichero;
int proceso;
int tiles;
int dur;
int gfx_bola;
int tiempo=0;
int tiempo_espera=0;
string mapa;
string backstr = "gfx/back.fpg";
int back;

process put(graph,x,y);
begin
loop
frame;
end
end		   

  function pinta_mapa(string mapa,int tiempo_espera);
  private;
     string linea;
     int tgraph;
     int tx;
     int ty;
	 string gfondo;

  begin
         set_fps(0,0);
        // signal(cursor(),s_kill);
		 fichero=fopen(mapa,o_read);
     
			loop
			
			       linea=fgets(fichero);
                   if(linea=="<tile>");				   
		           tgraph=fgets(fichero);
			       if(tgraph=>-1);
			       graph=tgraph;
			end
			       tx=fgets(fichero);
			       if(tx=>0);
			       x=tx;
			end
			       ty=fgets(fichero);
			       if(ty=>0);
			       y=ty;
		    end

					end	 
			       proceso=put(tgraph,tx,ty);
		           tiempo=tiempo+1;
	               if(tiempo=>tiempo_espera);
			end	   
            		if(feof(fichero));
					break;
			end
	    frame;
      end
    end

		 


		 
		 
		 
		   