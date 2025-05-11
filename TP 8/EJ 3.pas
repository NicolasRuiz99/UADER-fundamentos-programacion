Program TP8_3;
uses crt;
const
     m=5;
     n=10;
type
    t_d=integer;
    t_m=array [1..m,1..n] of t_d;
var
   matriz:t_m;
   f,c:word;
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
     begin
         writeln ('Fila ', f);
         for c:=1 to n do
         begin
             writeln ('Columna ', c);
             readln (mat[f,c]);
         end;
     end;
end;
procedure sumatoria (var mat:t_m);
var f:1..m; c:1..n; aux:t_d;
begin
     aux:=0;
     for c:=1 to n do
     begin
         for f:=1 to m do
              aux:=aux+mat[f,c];
         writeln ('La sumatoria de la columna ', c, ' es de ', aux);
         aux:=0;
     end;
end;
procedure mayor (var mat:t_m);
var f:1..m; c:1..n; may:t_d;
begin
     for c:=1 to n do
     begin
     may:=mat[1,c];
         for f:=1 to m do
         begin
              if mat[f,c] > may then
                 may:=mat[f,c];
         end;
         writeln ('El mayor valor de la columna ', c, ' es ', may);
     end;
end;
procedure menor (var mat:t_m; var fila:word; var columna:word);
var f:1..m; c:1..n; aux:t_d;
begin
     aux:=mat[1,1];
     for f:=1 to m do
         for c:=1 to n do
         begin
              if mat[f,c] < aux then
              begin
                   aux:=mat[f,c];
                   fila:=f;
                   columna:=c;
              end;
         end;
end;
begin
     inicializar (matriz);
     cargar (matriz);
     sumatoria (matriz);
     mayor (matriz);
     menor (matriz,f,c);
     writeln ('El menor elemento de la matriz se encuentra en la fila ', f, ', columna ', c);
     readkey;
end.
