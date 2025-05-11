unit Reservas;
interface
uses crt,dos;
type
    t_fecha=record
                  dia:integer;
                  mes:integer;
                  anio:integer;
                  hora:integer;
                  minutos:integer;
                  end;
    t_reserva=record
                    id_reserva:integer;
                    id_pasajero:integer;
                    id_vuelo:integer;
                    fecha:t_fecha;
                    costo:real;
                    activo:boolean;
                    end;
    reserva= file of t_reserva;


var arch:reserva; reg:t_reserva; pos:integer; buscado:integer;

procedure abrir_reserva (var arch:reserva);
procedure leer_reserva (var arch:reserva; pos:integer; var reg:t_reserva);
procedure guardar_reserva (var arch:reserva; reg:t_reserva);
procedure modificar_res (var arch:reserva; pos:integer; reg:t_reserva);
procedure buscar_reserva_id(var arch:reserva; var reg:t_reserva; var pos:integer; buscado:integer);
Procedure ordenar_reserva(var arch:reserva);
	
implementation


procedure abrir_reserva (var arch:reserva);
begin
     assign (arch,'reservas.dat');
     reset (arch);
     if ioresult <> 0 then
     rewrite (arch);
end;

procedure leer_reserva (var arch:reserva; pos:integer; var reg:t_reserva);
begin
     seek (arch,pos);
     read (arch,reg);
end;
procedure guardar_reserva (var arch:reserva; reg:t_reserva);
begin
     seek (arch, filesize (arch));
     write (arch,reg);
end;

procedure modificar_res (var arch:reserva; pos:integer; reg:t_reserva);
begin
     seek (arch,pos);
     write (arch,reg);
end;

procedure buscar_reserva_id(var arch:reserva; var reg:t_reserva; var pos:integer; buscado:integer);
var p:integer;
begin
     seek (arch,0);
     p:=0;
     pos:=-1;
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_reserva(arch,p,reg);
          if buscado = reg.id_reserva then
             pos:=p;
          inc(p);
     end;
end;

Procedure ordenar_reserva(var arch:reserva);
var aux:t_reserva; reg2:t_reserva; reg1:t_reserva; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_reserva(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_reserva(arch,pos2,reg2);
               if (reg1.id_reserva > reg2.id_reserva) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_res(arch,pos1,reg1);
                    modificar_res(arch,pos2,reg2);
               end;
          end;
     end;
end;

end.
