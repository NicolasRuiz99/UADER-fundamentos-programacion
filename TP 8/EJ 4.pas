Program TP8_4;
uses crt;
const
     n=5;
     m=2;
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
function mayor (var mat:t_m):t_d;
var f:1..n; c:1..m; may:t_d;
begin
     may:=mat[1,1];
     for f:=1 to n do
         for c:=1 to m do
              if (((f+c) mod 2) = 0) and (mat[f,c] > may) then
                 may:=mat[f,c];
     mayor:=may;
end;
begin
     inicializar (matriz);
     cargar (matriz);
     writeln ('El numero mayor de la matriz es ', mayor (matriz));
     readkey;
end.
