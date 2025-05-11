Program TP8_5;
uses crt;
const
     s=2;
     n=12;
type
    t_m=array [1..s,1..n] of real;
var
   m:t_m;
procedure inicializar (var mat:t_m);
var f:1..s; c:1..n;
begin
     for f:=1 to s do
         for c:=1 to n do
             mat[f,c]:=0;
end;
procedure cargar (var mat:t_m);
var f:1..s; c:1..n;
begin
     for f:=1 to s do
         for c:=1 to n do
             readln (mat[f,c]);
end;
function mayor_monto (var mat:t_m):word;
var f:1..s; c:1..n; max:real;
begin
     max:=mat[1,1];
     mayor_monto:=1;
     for f:=1 to s do
         for c:=1 to n do
             if mat[f,c] > max then
             begin
                  max:=mat[f,c];
                  mayor_monto:=f;
             end;
end;
function menor_monto (var mat:t_m):word;
var f:1..s; c:1..n; min:real;
begin
     min:=mat[1,1];
     menor_monto:=1;
     for f:=1 to s do
         for c:=1 to n do
             if mat[f,c] < min then
             begin
                  min:=mat[f,c];
                  menor_monto:=c;
             end;
end;
begin
     inicializar (m);
     cargar (m);
     writeln ('El monto facturado del cliente 2 en el mes de agosto es de ', m[2,8]:2:2, ' $');
     writeln ('El cliente que registro el mayor monto de facturacion mensual fue el nro ', mayor_monto (m));
     writeln ('La menor facturacion mensual para un cliente se registro en el mes ', menor_monto (m));
     readkey;
end.
