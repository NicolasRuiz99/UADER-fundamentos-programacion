unit Aerolineas;
interface
uses crt,dos;
type
    t_aerolinea=record
                      id_aerolinea:integer;
                      nombre:string[40];
                      activo:boolean;
                      end;
    aerolinea= file of t_aerolinea;

var arch:aerolinea; reg:t_aerolinea; pos:integer; buscado:string; buscado2:integer;

procedure abrir_aerolinea (var arch:aerolinea);
procedure leer_aerolinea (var arch:aerolinea; pos:integer; var reg:t_aerolinea);
procedure guardar_aerolinea (var arch:aerolinea; reg:t_aerolinea);
procedure modificar_aerl (var arch:aerolinea; pos:integer; reg:t_aerolinea);
procedure buscar_aerolinea_nombre(var arch:aerolinea; var reg:t_aerolinea; var pos:integer; buscado:string);
procedure buscar_aerolinea_id(var arch:aerolinea; var reg:t_aerolinea; var pos:integer; buscado2:integer);
procedure ordenar_aerolinea(var arch:aerolinea);

implementation
procedure abrir_aerolinea (var arch:aerolinea);
begin
     assign (arch,'Aerolineas.dat');
     reset (arch);
     if ioresult <> 0 then
        rewrite (arch);
end;

procedure leer_aerolinea (var arch:aerolinea; pos:integer; var reg:t_aerolinea);
begin
     seek (arch,pos);
     read (arch,reg);
end;
procedure guardar_aerolinea (var arch:aerolinea; reg:t_aerolinea);
begin
     seek (arch, filesize (arch));
     write (arch,reg);
end;
procedure modificar_aerl (var arch:aerolinea; pos:integer; reg:t_aerolinea);
begin
     seek (arch,pos);
     write (arch,reg);
end;
procedure buscar_aerolinea_nombre(var arch:aerolinea; var reg:t_aerolinea; var pos:integer; buscado:string);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_aerolinea(arch,p,reg);
          if buscado = reg.nombre then
             pos:=p;
          inc(p);
     end;
end;

procedure buscar_aerolinea_id(var arch:aerolinea; var reg:t_aerolinea; var pos:integer; buscado2:integer);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_aerolinea(arch,p,reg);
          if buscado2 = reg.id_aerolinea then
             pos:=p;
          inc(p);
     end;
end;

procedure ordenar_aerolinea (var arch:aerolinea);
var aux:t_aerolinea; reg2:t_aerolinea; reg1:t_aerolinea; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_aerolinea(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_aerolinea(arch,pos2,reg2);
               if (reg1.id_aerolinea > reg2.id_aerolinea) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_aerl(arch,pos1,reg1);
                    modificar_aerl(arch,pos2,reg2);
               end;
          end;
     end;
end;

begin

end.
