Program TP9_6;
uses crt;
const
     n=100000;
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
          vector[lim]:=aux;
          readln (aux);
     end;
end;
procedure seleccion (var A:t_v; lim:word);
var aux,i,j,min:integer;
begin
     for i:=1 to (lim-1) do
     begin
          min:=i;
          for j:=(i+1) to n do
          begin
               if A[min] > A[j] then
                  min:=j;
               if min<>i then
               begin
                    aux:=A[min];
                    A[min]:=A[i];
                    A[i]:=aux;
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
begin
     l:=0;
     inicializar (v);
     cargar (v,l);
     seleccion (v,l);
     writeln ('Vector Ordenado');
     mostrar (v,l);
     readkey;
end.
