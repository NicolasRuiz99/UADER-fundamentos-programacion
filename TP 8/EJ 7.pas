Program TP8_7;
uses crt;
const
     n=10;
     m=10;
type
    t_d=integer;
    t_m= array [1..m,1..n] of t_d;
var
   matriz:t_m;
procedure inicializar (var mat:t_m);
var f:1..n; c:1..m;
begin
     for f:=1 to n do
         for c:=1 to m do
             mat[f,c]:=0;
end;
procedure cargar (var mat:t_m);
var f:1..n; c:1..m;
begin
     for f:=1 to n do
     begin
         writeln ('Fila ', f);
         for c:=1 to m do
         begin
            writeln ('Columna ', c);
            readln (mat[f,c]);
         end;
     end;
end;
function sumar (var mat:t_m):t_d;
var f:1..n; c:1..m; ac:t_d;
begin
     ac:=0;
     for f:=1 to n do
         for c:=1 to m do
             if c > f then
                ac:=ac+mat[f,c];
     sumar:=ac;
end;
begin
     inicializar (matriz);
     cargar (matriz);
     writeln ('La suma de los nros superiores a la diagonal principal es de ', sumar (matriz));
     readkey;
end.
