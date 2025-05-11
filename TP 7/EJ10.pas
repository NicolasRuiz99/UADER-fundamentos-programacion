Program TP7_10;
uses crt;
const
     n=100;
type
    t_vector= array [1..n] of real;
var
   v:t_vector;
   l,j:word;
procedure inicializar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_vector; var lim:word);
var aux:real;
begin
    readln (aux);
    while (lim<n) and (aux<>0) do
    begin
         inc (lim);
         vector[lim]:= aux;
         readln (aux);
    end;
end;
procedure edad (var vector:t_vector; lim:word; var jovenes:word);
var i:integer;
begin
     jovenes:=0;
     for i:=1 to lim do
     begin
          if (vector[i] > 20) and (vector[i] < 40) then
             inc (jovenes);
     end;
end;
begin
     l:=0;
     inicializar (v);
     cargar (v,l);
     edad (v,l,j);
     writeln ('Hay una cantidad de ', j, ' jovenes');
     readkey;
end.
