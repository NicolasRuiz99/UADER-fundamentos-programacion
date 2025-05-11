//Dada una matriz cuadrada realizar la suma de los elementos de la diagonal principal
Program Mat_Diagonal;
uses crt;
const
     n=2;
type
    t_m=array [1..n,1..n] of integer;
var
   m:t_m;
procedure inicializar (var mat:t_m);
var f,c:1..n;
begin
     for f:=1 to n do
         for c:=1 to n do
             mat[f,c]:=0;
end;
procedure cargar (var mat:t_m);
var f,c:1..n;
begin
     for f:=1 to n do
         for c:=1 to n do
             readln (mat[f,c]);
end;
function suma (var mat:t_m):integer;
var f,c:1..n; ac:integer;
begin
     ac:=0;
     for f:=1 to n do
         for c:=1 to n do
             if f = c then
                ac:=ac+mat[f,c];
     suma:=ac;
end;
begin
     inicializar (m);
     cargar (m);
     writeln ('La suma de los elementos de la diagonal principal es de ', suma (m));
     readkey;
end.
