unit Pasajeros;
interface
uses crt,ventas,reservas,vuelos;
type
    t_pasajero=record
                      id_pasajero:integer; //DNI
                      nomyap:string [40];
                      nacionalidad:string [60];
                      activo:boolean;
                      end;
    pasajero= file of t_pasajero;

var arch:pasajero; reg:t_pasajero; pos:integer; buscado:string; buscado2:integer; reg_v:t_venta; id_p:integer; reg_r:t_reserva;

procedure abrir_pasajero (var arch:pasajero);
procedure leer_pasajero (var arch:pasajero; pos:integer; var reg:t_pasajero);
procedure guardar_pasajero (var arch:pasajero; reg:t_pasajero);
procedure modificar_pas (var arch:pasajero; pos:integer; reg:t_pasajero);
procedure buscar_pasajero_nombre(var arch:pasajero; var reg:t_pasajero; var pos:integer; buscado:string);
procedure buscar_pasajero_id(var arch:pasajero; var reg:t_pasajero; var pos:integer; buscado2:integer);
procedure ordenar_pasajero(var arch:pasajero);

implementation

procedure abrir_pasajero (var arch:pasajero);
begin
     assign (arch,'pasajeros.dat');
     reset (arch);
     if ioresult <> 0 then
        rewrite (arch);
end;

procedure leer_pasajero (var arch:pasajero; pos:integer; var reg:t_pasajero);
begin
     seek (arch,pos);
     read (arch,reg);
end;

procedure guardar_pasajero (var arch:pasajero; reg:t_pasajero);
begin
     seek (arch, filesize (arch));
     write (arch,reg);
end;

procedure modificar_pas (var arch:pasajero; pos:integer; reg:t_pasajero);
begin
     seek (arch,pos);
     write (arch,reg);
end;

procedure buscar_pasajero_nombre(var arch:pasajero; var reg:t_pasajero; var pos:integer; buscado:string);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_pasajero(arch,p,reg);
          if buscado = reg.nomyap then
             pos:=p;
          inc(p);
     end;
end;

procedure buscar_pasajero_id(var arch:pasajero; var reg:t_pasajero; var pos:integer; buscado2:integer);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek(arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_pasajero(arch,p,reg);
          if (buscado2 = reg.id_pasajero) then
             pos:=p;
          inc(p);
     end;
end;

procedure ordenar_pasajero(var arch:pasajero);
var aux:t_pasajero; reg2:t_pasajero; reg1:t_pasajero; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_pasajero(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_pasajero(arch,pos2,reg2);
               if (reg1.id_pasajero > reg2.id_pasajero) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_pas(arch,pos1,reg1);
                    modificar_pas(arch,pos2,reg2);
               end;
          end;
     end;
end;

begin

end.
