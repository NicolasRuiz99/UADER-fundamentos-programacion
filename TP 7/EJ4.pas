Program TP7_4;
uses crt;
const
     n=20;
type
    t_vector= array [1..n] of integer;
var
   vector:t_vector;
procedure inicializar (var v:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         v[i]:=0;
end;
procedure cargar (var v:t_vector);
var i:1..n;
begin
     for i:=1 to n do
     begin
          if (i mod 2) = 0 then
          begin
               v[i]:=0;
          end
          else
              v[i]:=1;
     end;
end;
procedure escribir (var v:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         writeln (v[i]);
end;
begin
     inicializar (vector);
     cargar (vector);
     escribir (vector);
     readkey;
end.
