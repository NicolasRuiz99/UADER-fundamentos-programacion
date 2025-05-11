Program TP11_10;
uses crt;
const
     n=1000;
type
    t_r=record
              nombre:string[50];
              direccion:string[70];
              nro_tel:word;
    end;
    t_v=array [1..n] of t_r;
var
   v:t_v;
   l,p:word;
   busc:string[50];
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     for i:=1 to n do
         with vector[i] do
         begin
              nombre:=' ';
              direccion:=' ';
              nro_tel:=0;
         end;
     lim:=0;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:string[30];
begin
     writeln ('Nombre');
     readln (aux);
     while (lim<=n) and (aux<>'z') do
     begin
          inc (lim);
          with vector[lim] do
          begin
               nombre:=aux;
               writeln ('Direccion');
               readln (direccion);
               writeln ('Nro de telefono');
               readln (nro_tel);
          end;
          writeln ('Nombre');
          readln (aux);
      end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:1..n; aux:t_r;
begin
     for i:=1 to lim-1 do
         for j:=1 to lim-i do
             if vector[j].nombre > vector[j+1].nombre then
             begin
                  aux:=vector[j];
                  vector[j]:=vector[j+1];
                  vector[j+1]:=aux;
             end;
end;
procedure bbin (var vector:t_v; lim:word; var pos:word; buscado:string[50]);
var pri,ult,med:word;
begin
     pri:=1;
     ult:=lim;
     while (pos=0) and (pri<=ult) do
     begin
          med:= (pri+ult) div 2;
          if vector[med].nombre = buscado then
          begin
               pos:=med;
          end
          else
              if vector[med].nombre < buscado then
              begin
                   pri:=med+1;
              end
              else
                  ult:=med-1;
     end;
end;
procedure listar (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
            with vector[i] do
            begin
                 if nro_tel = 0 then
                 begin
                 end
                 else
                     writeln ('Nombre: ', nombre, '; Direccion: ', direccion);
            end;
end;
procedure listar_sinnro (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
            with vector[i] do
            begin
                 if nro_tel <> 0 then
                 begin
                 end
                 else
                     writeln ('Nombre: ', nombre, '; Direccion: ', direccion);
            end;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     ordenar (v,l);
     writeln ('Listado de personas con nro telefonico');
     listar (v,l);
     writeln ('Listado de personas sin nro telefonico');
     listar_sinnro (v,l);
     p:=0;
     while p=0 do
     begin
          writeln ('Ingrese una persona para buscar');
          readln (busc);
          bbin (v,l,p,busc);
     end;
     with v[p] do
     begin
          if nro_tel = 0 then
          begin
               writeln ('Nombre: ', nombre, '; Direccion: ', direccion);
          end
          else
              writeln ('Nombre: ', nombre, '; Direccion: ', direccion, '; Nro de telefono: ', nro_tel);
     end;
     readkey;
end.
