unit Ventas;
interface
uses crt;
type
    t_fecha=record
                  dia:integer;
                  mes:integer;
                  anio:integer;
                  hora:integer;
                  minutos:integer;
                  end;
    t_venta=record
                  id_venta:integer;
                  id_pasajero:integer;
                  id_vuelo:integer;
                  fecha:t_fecha;
                  costo:real;
                  activo:boolean;
                  end;
    venta= file of t_venta;

var arch:venta; reg:t_venta; pos:integer; buscado:string;

procedure abrir_venta (var arch:venta);
procedure leer_venta (var arch:venta; pos:integer; var reg:t_venta);
procedure guardar_venta (var arch:venta; reg:t_venta);
procedure modificar_ven (var arch:venta; pos:integer; reg:t_venta);
procedure buscar_venta_id(var arch:venta; var reg:t_venta; var pos:integer; buscado:integer);
procedure ordenar_venta(var arch:venta);

implementation

procedure abrir_venta (var arch:venta);
begin
     assign (arch,'ventas.dat');
     reset (arch);
     if ioresult <> 0 then
        rewrite (arch);
end;

procedure leer_venta (var arch:venta; pos:integer; var reg:t_venta);
begin
     seek (arch,pos);
     read (arch,reg);
end;

procedure guardar_venta (var arch:venta; reg:t_venta);
begin
     seek (arch, filesize (arch));
     write (arch,reg);
end;

procedure modificar_ven (var arch:venta; pos:integer; reg:t_venta);
begin
     seek (arch,pos);
     write (arch,reg);
end;

procedure buscar_venta_id(var arch:venta; var reg:t_venta; var pos:integer; buscado:integer);
var p:integer;
begin
     p:=0;
     pos:=-1;
     seek (arch,0);
     while (not eof(arch)) and (pos = -1) do
     begin
          leer_venta(arch,p,reg);
          if buscado = reg.id_venta then
             pos:=p;
          inc(p);
     end;
end;

procedure ordenar_venta(var arch:venta);
var aux:t_venta; reg2:t_venta; reg1:t_venta; pos1:integer; pos2:integer;
begin
     for pos1 := 0 to (filesize(arch) - 1) do
     begin
          leer_venta(arch,pos1,reg1);
          for pos2 := (filesize(arch) - 1) downto (pos1 + 1) do
          begin
               leer_venta(arch,pos2,reg2);
               if (reg1.id_venta > reg2.id_venta) then
               begin
                    aux:=reg1;
                    reg1:=reg2;
                    reg2:=aux;
                    modificar_ven(arch,pos1,reg1);
                    modificar_ven(arch,pos2,reg2);
               end;
          end;
     end;
end;

begin

end.
