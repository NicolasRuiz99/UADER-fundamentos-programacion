unit Aeropuertos;
interface
uses crt;
type
    t_aeropuerto=record
                      id_aeropuerto:integer;
                      nombre:string[40];
                      pais:string[30];
                      ciudad:string[30];
                      activo:boolean;
                      end;
    aeropuerto= file of t_aeropuerto;

var arch:aeropuerto; reg:t_aeropuerto; pos:integer; buscado:string; buscado2:integer;

procedure abrir_aeropuerto (var arch:aeropuerto);
procedure leer_aeropuerto (var arch:aeropuerto; pos:integer; var reg:t_aeropuerto);
procedure guardar_aeropuerto (var arch:aeropuerto; reg:t_aeropuerto);
procedure modificar_aero (var arch:aeropuerto; pos:integer; reg:t_aeropuerto);
procedure buscar_aeropuerto_nombre(var arch:aeropuerto; var reg:t_aeropuerto; var pos:integer; buscado:string);
procedure buscar_aeropuerto_id(var arch:aeropuerto; var reg:t_aeropuerto; var pos:integer; buscado2:integer);
procedure ordenar_aeropuerto(var arch:aeropuerto);

implementation

procedure abrir_aeropuerto (var arch:aeropuerto);
begin
     assign (arch,'aeropuertos.dat');
     reset (arch);
     if ioresult <> 0 then
        rewrite (arch);
end;

procedure leer_aeropuerto (var arch:aeropuerto; pos:integer; var reg:t_aeropuerto);
begin
     seek (arch,pos);
     read (arch,reg);
end;

procedure guardar_aeropuerto (var arch:aeropuerto; reg:t_aeropuerto);
begin
     seek (arch, filesize (arch));
     write (arch,reg);
end;

procedure modificar_aero (var arch:aeropuerto; pos:integer; reg:t_aeropuerto);
begin
     seek (arch,pos);
     write (arch,reg);
end;

procedure buscar_aeropuerto_nombre(var arch:aeropuerto; var reg:t_aeropuerto; var pos:integer; buscado:string);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_aeropuerto(arch,p,reg);
          if buscado = reg.nombre then
             pos:=p;
          inc(p);
     end;
end;

procedure buscar_aeropuerto_id(var arch:aeropuerto; var reg:t_aeropuerto; var pos:integer; buscado2:integer);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_aeropuerto(arch,p,reg);
          if buscado2 = reg.id_aeropuerto then
             pos:=p;
          inc(p);
     end;
end;

procedure ordenar_aeropuerto(var arch:aeropuerto);
var aux:t_aeropuerto; reg2:t_aeropuerto; reg1:t_aeropuerto; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_aeropuerto(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_aeropuerto(arch,pos2,reg2);
               if (reg1.id_aeropuerto > reg2.id_aeropuerto) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_aero(arch,pos1,reg1);
                    modificar_aero(arch,pos2,reg2);
               end;
          end;
     end;
end;

begin

end.
