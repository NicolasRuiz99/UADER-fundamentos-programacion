//Un club realiza la cobranza de sus socios mediante 3 cobradores, c/socio posee los sig datos: DNI, apynom, domicilio, cuota, cobrador y zona. Se pide:
//A. Listado ordenado por zona y apellido
//B. Total general cobrado
//C. Realizar un procedimiento que se llame pagoxdni y que permita imputar el pago de cuotas a un socio
//D. Verificar si el socio xy existe (pueden ser varios), contarlos.
Program Socios;
uses crt;
const
     n=1000;
type
    t_r=record
              dni:integer;
              apellido:string[50];
              nombre:string[50];
              domicilio:string[50];
              cuota:real;
              cobrador:word;
              zona:string[50];
    end;
    t_v=array [1..n] of t_r;
var
   v:t_v;
   l,c:word;
   busc:integer;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
         with vector[i] do
         begin
              dni:=0;
              apellido:=' ';
              nombre:=' ';
              domicilio:=' ';
              cuota:=0;
              cobrador:=0;
              zona:=' ';
         end;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:integer;
begin
     writeln ('Socio 1');
     writeln ('DNI');
     readln (aux);
     while (lim<n) and (aux<>0) do
     begin
          inc (lim);
          with vector[lim] do
          begin
               dni:=aux;
               writeln ('Apellido');
               readln (apellido);
               writeln ('Nombre');
               readln (nombre);
               writeln ('Domicilio');
               readln (domicilio);
               writeln ('Cuota');
               readln (cuota);
               writeln ('Cobrador');
               readln (cobrador);
               writeln ('Zona');
               readln (zona);
          end;
          writeln ('Socio ', lim+1);
          writeln ('DNI');
          readln (aux);
      end;
end;
procedure mostrar (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         writeln ('Socio ', i);
         with vector[i] do
         begin
              writeln ('DNI: ', dni);
              writeln ('Apellido: ', apellido);
              writeln ('Nombre: ', nombre);
              writeln ('Domicilio: ', domicilio);
              writeln ('Cuota: ', cuota:2:2);
              writeln ('Cobrador: ', cobrador);
              writeln ('Zona: ', zona);
         end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:byte; aux1:string; aux2:integer; aux3:real; aux4:word;
begin
     for i:=1 to (lim-1) do
         for j:=1 to (lim-i) do
             if (vector[j].zona+vector[j].apellido) > (vector[j+1].zona+vector[j+1].apellido) then
             begin
                  aux2:=vector[j].dni;
                  vector[j].dni:=vector[j+1].dni;
                  vector[j+1].dni:=aux2;
                  aux1:=vector[j].apellido;
                  vector[j].apellido:=vector[j+1].apellido;
                  vector[j+1].apellido:=aux1;
                  aux1:=vector[j].nombre;
                  vector[j].nombre:=vector[j+1].nombre;
                  vector[j+1].nombre:=aux1;
                  aux1:=vector[j].domicilio;
                  vector[j].domicilio:=vector[j+1].domicilio;
                  vector[j+1].domicilio:=aux1;
                  aux3:=vector[j].cuota;
                  vector[j].cuota:=vector[j+1].cuota;
                  vector[j+1].cuota:=aux3;
                  aux4:=vector[j].cobrador;
                  vector[j].cobrador:=vector[j+1].cobrador;
                  vector[j+1].cobrador:=aux4;
                  aux1:=vector[j].zona;
                  vector[j].zona:=vector[j+1].zona;
                  vector[j+1].zona:=aux1;
             end;
end;
function totalcobrado (var vector:t_v; lim:word):real;
var i:1..n; aux:real;
begin
     aux:=0;
     for i:=1 to lim do
         aux:=aux+vector[i].cuota;
     totalcobrado:=aux;
end;
procedure bbin1 (var vector:t_v; lim:word; buscado:integer; var pos:word);
var med,pri,ult:byte;
begin
     pri:=1;
     ult:=lim;
     pos:=0;
     while (pri<=ult) and (pos<>0) do
     begin
          med:=(pri+ult)div 2;
          if vector[med].dni = buscado then
          begin
               pos:=med;
          end
          else
          begin
               if vector[med].dni>buscado then
               begin
                    ult:=med-1;
               end
               else
                   pri:=med+1;
          end;
      end;
end;
procedure bbin2 (var vector:t_v; lim:word; buscado:string[50]; var pos:word);
var med,pri,ult:byte;
begin
     pri:=1;
     ult:=lim;
     pos:=0;
     while (pri<=ult) and (pos<>0) do
     begin
          med:=(pri+ult)div 2;
          if (vector[med].apellido + vector[med].nombre) = buscado then
          begin
               pos:=med;
          end
          else
          begin
               if (vector[med].apellido + vector[med].nombre)>buscado then
               begin
                    ult:=med-1;
               end
               else
                   pri:=med+1;
          end;
      end;
end;
procedure pagoxdni (var vector:t_v; lim:word; buscado:integer);
var aux:real; pos:word;
begin
     pos:=0;
     bbin1 (vector,lim,buscado,pos);
     if pos<>0 then
     begin
          writeln ('Ingrese el importe que desea imputar al socio');
          readln (aux);
          vector[pos].cuota:=vector[pos].cuota;
     end
     else
         writeln ('El DNI ingresado no pertenece a ninguno de los socios del club');
end;
procedure buscarsocio (var vector:t_v; lim:word; var cont:word);
var buscado:string[50]; pos:word; aux:word;
begin
     pos:=0;
     cont:=0;
     aux:=0;
     while pos = 0 do
     begin
          writeln ('Ingrese un socio para buscar');
          readln (buscado);
          bbin2 (vector,lim,buscado,pos);
          if pos <> 0 then
          begin
               inc (cont);
               while (aux<pos) do
               begin
                    inc (aux);
                    if (vector[aux].apellido + vector[aux].nombre) = buscado then
                       inc (cont);
               end;
          end
          else
              writeln ('El socio buscado no existe');
      end;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     ordenar (v,l);
     writeln ('Presione una tecla para ver la lista ordenada de socios');
     readkey;
     clrscr;
     mostrar (v,l);
     writeln ('El total general cobrado es de ', totalcobrado (v,l):2:2, ' $');
     writeln ('Ingrese el DNI de un socio al que desea imputar el pago de la cuota');
     readln (busc);
     pagoxdni (v,l,busc);
     buscarsocio (v,l,c);
     if c = 1 then
     begin
          writeln ('El socio buscado existe');
     end
     else
         if c>=1 then
            writeln ('El socio buscado existe y se encuentra , ', c, ' veces');
     readkey;
end.
