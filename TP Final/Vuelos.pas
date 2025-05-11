unit Vuelos;
interface
uses crt,validacion;
const
     m=3;
type
    t_escala=array [1..m] of integer;
    t_fecha=record
                  dia:integer;
                  mes:integer;
                  anio:integer;
                  hora:integer;
                  minutos:integer;
                  end;
    t_vuelo=record
                  id_vuelo:integer;
                  aeropuerto_origen:integer;
                  aeropuerto_destino:integer;
                  fecha_partida:t_fecha;
                  fecha_llegada:t_fecha;
                  id_aerolinea:integer;
                  estado:string [40];
                  cant_pasajeros:integer;
                  escalas:t_escala;
                  cant_escalas:integer;
                  activo:boolean;
                  end;
    vuelo= file of t_vuelo;

var arch:vuelo; reg:t_vuelo; pos:integer; buscado:integer; lim:integer;

procedure abrir_vuelo (var arch:vuelo);
procedure leer_vuelo (var arch:vuelo; pos:integer; var reg:t_vuelo);
procedure guardar_vuelo (var arch:vuelo; reg:t_vuelo);
procedure modificar_v (var arch:vuelo; pos:integer; reg:t_vuelo);
procedure buscar_vuelo_id(var arch:vuelo; var reg:t_vuelo; var pos:integer; buscado:integer);
procedure inicializar (var escalas:t_escala);
procedure ordenar_vuelo(var arch:vuelo);
procedure aumentar_pasajeros_vuelos(var arch:vuelo; pos2:integer);
procedure reducir_pasajeros_vuelos(var arch:vuelo; pos2:integer);

implementation

procedure abrir_vuelo (var arch:vuelo);
begin
     assign (arch,'vuelos.dat');
     reset (arch);
     if ioresult <> 0 then
        rewrite (arch);
end;

procedure leer_vuelo (var arch:vuelo; pos:integer; var reg:t_vuelo);
begin
     seek (arch,pos);
     read (arch,reg);
end;

procedure guardar_vuelo (var arch:vuelo; reg:t_vuelo);
begin
     seek (arch, filesize (arch));
     write (arch,reg);
end;

procedure modificar_v (var arch:vuelo; pos:integer; reg:t_vuelo);
begin
     seek (arch,pos);
     write (arch,reg);
end;

procedure inicializar (var escalas:t_escala);
var i:1..m;
begin
     for i:=1 to m do
         escalas[i]:=0;
end;

procedure buscar_vuelo_id(var arch:vuelo; var reg:t_vuelo; var pos:integer; buscado:integer);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_vuelo(arch,p,reg);
          if (buscado = reg.id_vuelo) then
             pos:=p;
          inc(p);
     end;
end;

procedure ordenar_vuelo(var arch:vuelo);
var aux:t_vuelo; reg2:t_vuelo; reg1:t_vuelo; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_vuelo(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_vuelo(arch,pos2,reg2);
               if (reg1.id_vuelo > reg2.id_vuelo) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_v(arch,pos1,reg1);
                    modificar_v(arch,pos2,reg2);
               end;
          end;
     end;
end;

procedure aumentar_pasajeros_vuelos(var arch:vuelo; pos2:integer);
var reg:t_vuelo;
begin
     leer_vuelo(arch,pos2,reg);
     inc(reg.cant_pasajeros);
     modificar_v(arch,pos2,reg);
end;

procedure reducir_pasajeros_vuelos(var arch:vuelo; pos2:integer);
var reg:t_vuelo;
begin
     leer_vuelo(arch,pos2,reg);
     dec(reg.cant_pasajeros);
     modificar_v(arch,pos2,reg);
end;

begin

end.
