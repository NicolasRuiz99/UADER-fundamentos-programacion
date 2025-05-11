Program TP7_13;
uses crt;
const
     n=100;
type
    t_vector= array [1..n] of integer;
var
   v:t_vector;
   l:word;
procedure inicializar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_vector; var lim:word);
var aux:integer;
begin
    readln (aux);
    while (lim<n) and (aux<>0) do
    begin
         inc (lim);
         vector[lim]:= aux;
         readln (aux);
    end;
end;
procedure invertir (var vector:t_vector; lim:word);
var i:integer;
begin
     for i:=lim downto 1 do
         writeln (vector[i]);
end;
begin
     l:=0;
     inicializar (v);
     cargar (v,l);
     invertir (v,l);
     readkey;
end.
