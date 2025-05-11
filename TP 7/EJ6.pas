Program TP7_6;
uses crt;
const
     n=5;
type
    t_vector=array [1..n] of char;
var
   v,vb:t_vector;
procedure inicializar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=' ';
end;
procedure cargar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         readln (vector[i]);
end;
procedure genb (vector:t_vector; var vectorb:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         vectorb[i]:=vector[i];
end;
procedure mostrarB (vectorb:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         writeln (vectorb[i]);
end;
begin
     inicializar (v);
     cargar (v);
     genb (v,vb);
     mostrarB (vb);
     readkey;
end.
