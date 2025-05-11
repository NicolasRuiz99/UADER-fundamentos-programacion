Program TP9_2X;
uses crt;
const
     n=10000;
type
    t_v=array [1..n] of integer;
var
   v:t_v;
   l:word;
   busc:integer;
   p:byte;
procedure inicializar (var vector:t_v; var lim:word);
var i:1..n;
begin
     lim:=0;
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:integer;
begin
     readln (aux);
     while (lim<=n) and (aux<>0) do
     begin
          inc (lim);
          vector[lim]:=aux;
          readln (aux);
     end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:1..n;
    aux:integer;
begin
     for i:=1 to (lim-1) do
         for j:=1 to (lim-i) do
         begin
              if vector[j] > vector[j+1] then
              begin
                   aux:=vector[j];
                   vector[j]:=vector[j+1];
                   vector[j+1]:=aux;
              end;
         end;
end;
procedure bin (var vector:t_v; lim:word; var pos:byte; buscado:integer);
var min,max,med:byte;
begin
     min:=1;
     max:=lim;
     pos:=0;
     while (min<=max) and (pos=0) do
     begin
          med:= (min+max) div 2;
          if vector[med] = buscado then
          begin
               pos:=med;
          end
          else
          begin
               if vector[med] > buscado then
               begin
                    max:= med -1;
               end
               else
                   min:=med+1;
          end;
    end;
end;
begin
     inicializar (v,l);
     cargar (v,l);
     ordenar (v,l);
     writeln ('Ingrese un nro para buscar');
     readln (busc);
     bin (v,l,p,busc);
     if p <> 0 then
     begin
          writeln ('El nro ', busc, ' existe y se encuentra en la posicion ', p);
     end
     else
         writeln ('El nro ', busc, ' no existe');
     readkey;
end.
