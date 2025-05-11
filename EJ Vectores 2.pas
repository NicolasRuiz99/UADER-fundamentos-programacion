//Se desea cargar un vector de nros y que la carga termine con un 0
//A. Ordenarlo
//B. Verificar si el nro 40 existe en la lista, mostrar su posicion
//C. Promedio de los nros del vector
//D. Cantidad de negativos y cantidad de positivos en la lista
//E. Porcentaje que representan los nros negativos sobre el total
Program EJVectores2;
uses crt;
const
     n=10000;
type
    t_v=array [1..n] of integer;
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
          vector[lim]:= aux;
          readln (aux);
     end;
end;
procedure ordenar (var vector:t_v; lim:word);
var i,aux:integer; orden:boolean;
begin
     orden:=false;
     while not (orden) do
     begin
          orden:=true;
          for i:=1 to (lim-1) do
          begin
               if vector[i]>vector[i+1] then
               begin
                    orden:=false;
                    aux:=vector[i];
                    vector[i]:=vector[i+1];
                    vector[i+1]:=aux;
               end;
          end;
     end;
end;
procedure mostrar (var vector:t_v; lim:word);
var i:1..n;
begin
     for i:=1 to lim do
         writeln (vector[i]);
end;
function buscar (var vector:t_v; lim:word):integer;
var pos:integer;
begin
     buscar:=0;
     pos:=0;
     while (buscar=0) and (pos<lim) do
     begin
          inc (pos);
          if 40 = vector[pos] then
             buscar:=pos;
     end;
end;
function promedio (var vector:t_v; lim:word):real;
var i:1..n;  aux:integer;
begin
     aux:=0;
     for i:=1 to lim do
         aux:=aux+vector[i];
     promedio:= aux/lim;
end;
function numpos (var vector:t_v; lim:word):word;
var i:1..n; aux:integer;
begin
     aux:=0;
     for i:=1 to lim do
     begin
          if vector[i] > 0 then
             inc (aux);
     end;
     numpos:=aux;
end;
function numneg (var vector:t_v; lim:word):word;
var i:1..n; aux:integer;
begin
     aux:=0;
     for i:=1 to lim do
     begin
          if vector[i] < 0 then
             inc (aux);
     end;
     numneg:=aux;
end;
begin
     l:=0;
     inicializar (v);
     cargar (v,l);
     ordenar (v,l);
     writeln ('Vector ordenado');
     mostrar (v,l);
     if buscar (v,l) <> 0 then
     begin
          writeln ('El nro 40 existe y se encuentra en la pos ', buscar (v,l));
     end
     else
         writeln ('El nro 40 no existe');
     writeln ('El promedio de los nros del vector es de ', promedio (v,l):2:2);
     writeln ('Hay ', numpos (v,l), ' numeros positivos en la lista y ', numneg (v,l), ' negativos');
     writeln ('Los numeros negativos representan un ', ((numneg (v,l) * 100) / l):2:2, ' %');
     readkey;
end.
