//En una matriz cuadrada
//A. Buscar un maximo y ver si se repite.
Program MaxMatriz;
uses crt;
const
     n=2;
type
    t_m=array [1..n,1..n] of integer;
var
   m:t_m;
   max:integer;
   c:word;
procedure inicializar (var mat:t_m);
var f,c:word;
begin
     for f:=1 to n do
         for c:=1 to n do
             mat[f,c]:=0;
end;
procedure cargar (var mat:t_m);
var f,c:word;
begin
     for f:=1 to n do
         for c:=1 to n do
             readln (mat[f,c]);
end;
procedure maximo (var mat:t_m; var res:integer; var cant:word);
var f,c:word;
begin
     res:=mat[1,1];
     for f:=1 to n do
         for c:=1 to n do
         begin
              if mat[f,c] > res then
              begin
                   res:=mat[f,c];
                   cant:=1;
              end
              else
                  if mat[f,c] = res then
                     inc (cant);
          end;
end;
begin
     inicializar (m);
     cargar (m);
     c:=0;
     maximo (m,max,c);
     if c > 1 then
     begin
     writeln ('El valor maximo de la matriz es: ', max, ' y aparece ', c, ' veces');
     end
     else
         writeln ('El valor maximo absoluto es: ', max);
     readkey;
end.
