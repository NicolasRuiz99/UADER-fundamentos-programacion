Program TP8_2;
uses crt;
const
     m=20;
     n=30;
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
         writeln ('Articulo ', f);
         for c:=1 to m do
         begin
            writeln ('Sucursal ', c);
            readln (mat[f,c]);
         end;
     end;
end;
procedure acumularF (var mat:t_m);
var f:1..n; c:1..m; ac:t_d;
begin
     ac:=0;
     for f:=1 to n do
     begin
         for c:=1 to m do
             ac:=ac+mat[f,c];
         writeln ('El total de ventas del articulo ', f, ' es de ', ac, ' unidades');
         ac:=0;
     end;
end;
procedure acumularC (var mat:t_m);
var f:1..n; c:1..m; ac:t_d;
begin
     ac:=0;
     for c:=1 to m do
     begin
         for f:=1 to n do
             ac:=ac+mat[f,c];
         writeln ('El total de ventas de la sucursal ', c, ' es de ', ac, ' unidades');
         ac:=0;
     end;
end;
begin
     inicializar (matriz);
     cargar (matriz);
     acumularF (matriz);
     acumularC (matriz);
     readkey;
end.
