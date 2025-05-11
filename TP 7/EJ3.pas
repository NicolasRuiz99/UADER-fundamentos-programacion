Program TP7_3;
uses crt;
const n=4;
type
    T_DATO=integer;
    T_VECTOR=array [1..N] of T_DATO;
var
   vector: T_VECTOR;
   s:integer;
procedure inicializar (var v:T_VECTOR);
var i:1..n;
begin
     for i:=1 to n do
         v[i]:=0;
end;
procedure cargar (var v:T_VECTOR);
var i:1..n;
begin
     for i:=1 to n do
         readln (v[i]);
end;
procedure sumatoriapar (var v:T_VECTOR; var suma:integer);
var i:1..n;
begin
     for i:=1 to n do
     begin
         if (i mod 2)= 0 then
            suma:=suma + v[i];
     end;
end;
begin
     inicializar (vector);
     cargar (vector);
     s:=0;
     sumatoriapar (vector,s);
     writeln ('La sumatoria de los numeros pares es de ', s);
     readkey;
end.
