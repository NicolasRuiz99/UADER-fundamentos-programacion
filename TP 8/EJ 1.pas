//Alumnos: Flores Franco, Ruiz Nicolás.
Program TP8_1;
uses crt;
const
     n=4;
     g=25;
type
    t_d=integer;
    t_m=array [1..g,1..n] of t_d;
var
   m:t_m;
procedure inicializar (var mat:t_m);
var f:1..g; c:1..n;
begin
     for f:=1 to g do
         for c:=1 to n do
             mat[f,c]:=0;
end;
procedure cargar (var mat:t_m);
var f:1..g; c:1..n;
begin
     for f:=1 to g do
         for c:=1 to n do
             readln (mat[f,c]);
end;
procedure promedio (var mat:t_m);
var f:1..g; c:1..n; sum:integer; aux:real;
begin
     sum:=0;
     for f:=1 to g do
     begin
         for c:=1 to n do
             sum:=sum+mat[f,c];
         aux:=sum/4;
         sum:=0;
         writeln ('El promedio del alumno ', f, ' es ', aux:2:2);
     end;
end;
function prom_total (var mat:t_m):real;
var f:1..g; c:1..n; sum:integer; aux:real; prom:real;
begin
     prom:=0;
     sum:=0;
     for f:=1 to g do
     begin
         for c:=1 to n do
             sum:=sum+mat[f,c];
         aux:=sum/4;
         sum:=0;
         prom:=prom+aux;
     end;
     prom_total:=prom/g;
end;
begin
     inicializar (m);
     cargar (m);
     promedio (m);
     writeln ('El promedio total es de ', prom_total (m):2:2);
     readkey;
end.
