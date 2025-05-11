Program TP7_1;
uses crt;
const n=10;
type
    t_vector= array [1..n] of real;
var
   vector:t_vector;
   r:real;
procedure inicializar (var v:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         v[i]:=0;
end;
procedure leer (var v:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         readln (v[i]);
end;
function sumatoria (var v:t_vector):real;
var i:1..n;
    res:real;
begin
     res:=0;
     for i:=1 to n do
         res:=res+v[i];
     sumatoria:=res;
end;
begin
     inicializar (vector);
     leer (vector);
     r:= sumatoria (vector);
     writeln ('La sumatoria de los componentes del vector es de ', r:2:2);
     readkey;
end.
