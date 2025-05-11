Program TP9_5;
uses crt;
const
     n=10000;
type
    t_v= array [1..n] of integer;
var
   v:t_v;
   l:word;
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
     while (aux<>0) and (lim<n) do
     begin
          inc (lim);
          vector[lim]:=aux;
          readln (aux);
     end;
end;
function buscar (var vector:t_v; var lim:word):word;
var pos:word;
begin
     pos:=0;
     buscar:=0;
     while (buscar = 0) and (pos<lim) do
     begin
          inc (pos);
          if vector[pos] = 333 then
             buscar:=pos;
     end;
end;
begin
     l:=0;
     inicializar (v);
     cargar (v,l);
     if buscar(v,l) <> 0 then
     begin
          writeln ('El nro 333 existe y se encuentra en la posicion ', buscar(v,l));
     end
     else
         writeln ('El nro 333 no existe');
     readkey;
end.
