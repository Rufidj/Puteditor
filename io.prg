global

process explorador();
private
string extension = "*.ped";
string archivo;
int cont=1;
begin
     let_me_alone();
	 write_delete(all_text);
     chdir("levels");
     archivo=glob(extension);
	 while(archivo!="");
	 write(0,10,cont*10,0,cont+"- "+archivo); 
	 cont=cont+1;
	 archivo=glob(extension);
	 end
     loop
	 
	 frame;
	 end