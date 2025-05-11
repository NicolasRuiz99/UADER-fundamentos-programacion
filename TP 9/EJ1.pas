//Alumnos: Flores Franco, Ruiz Nicolás.
Program TP9_1;
uses crt;
const
     n=100000;
type
    t_v=array [1..n] of real;
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
var aux:real;
begin
     readln (aux);
     while (aux>=0) and (lim<n) do
     begin
          inc (lim);
          vector[lim]:=aux;
          readln (aux);
     end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,j:word;
    aux:real;
begin
     for i:=1 to (lim-1) do
     begin
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
end;
procedure mostrar (var vector:t_v; lim:word);
var i:integer;
begin
     for i:=1 to lim do
         writeln (vector[i]:2:2);
end;
function buscar (var vector:t_v; lim:word):word;
var aux:word;
begin
     buscar:=0;
     aux:=0;
     while (buscar=0) and (aux<lim) do
     begin
          inc (aux);
          if vector[aux] = 27 then
             buscar:=aux;
     end;
end;
begin
     l:=0;
     inicializar (v);
     cargar (v,l);
     ordenar (v,l);
     writeln ('Vector ordenado de forma creciente');
     mostrar  (v,l);
     if buscar (v,l) <> 0 then
     begin
          writeln ('El numero 27 existe y se encuentra en la posicion ', buscar (v,l));
     end
     else
         writeln ('No se encuentra el numero 27 en el vector');
     readkey;
end.
