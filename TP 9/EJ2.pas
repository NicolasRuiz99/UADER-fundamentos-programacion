Program TP9_2;
uses crt;
const
     n=1000;
type
    t_v=array [1..n] of integer;
var
   v:t_v;
   l:word;
   busc:integer;
procedure inicializar (var vector:t_v);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_v; var lim:word);
var aux:integer;
begin
     readln (aux);
     while (aux <> 0) and (lim<n) do
     begin
          inc (lim);
          vector[lim]:=aux;
          readln (aux);
     end;
end;
function buscar (var vector:t_v; lim:word; buscado:integer):word;
var pos:word;
begin
     pos:=0;
     buscar:=0;
     while (buscar = 0) and (pos<lim) do
     begin
          inc (pos);
          if buscado = vector[pos] then
             buscar:=pos;
     end;
end;
begin
     l:=0;
     inicializar (v);
     cargar (v,l);
     writeln ('Ingrese el nro entero que desea buscar');
     readln (busc);
     if (buscar (v,l,busc))<>0 then
     begin
        writeln ('El numero ', busc, ' existe y se encuentra en la posicion ', buscar (v,l,busc));
     end
     else
         writeln ('El numero ', busc, ' no se encuentra en el vector');
     readkey;
end.
