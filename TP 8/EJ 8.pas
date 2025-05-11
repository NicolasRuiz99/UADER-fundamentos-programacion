Program TP8_8;
uses crt;
const
     m=3;
     n=3;
type
    t_d=integer;
    t_m=array [1..m,1..n] of t_d;
var
   matriz:t_m;
procedure inicializar (var mat:t_m);
var f:1..m; c:1..n;
begin
     for f:=1 to m do
         for c:=1 to n do
             mat[f,c]:=0;
end;
procedure cargar (var mat:t_m);
var f:1..m; c:1..n;
begin
     for f:=1 to m do
         for c:=1 to n do
             readln (mat[f,c]);
end;
function suma (var mat:t_m):t_d;
var f:1..m; c:1..n; aux:t_d;
begin
     aux:=0;
     for f:=1 to m do
         for c:=1 to n do
              if f=c then
                 aux:=aux+mat[f,c];
     suma:=aux;
end;
begin
     inicializar (matriz);
     cargar (matriz);
     writeln ('La suma de los elementos de la diagonal principal de la matriz dada es de ', suma (matriz));
     readkey;
end.
