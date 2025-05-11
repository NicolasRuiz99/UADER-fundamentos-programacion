Program TP7_7;
uses crt;
const
     n=100;
type
    t_vector= array [1..n] of real;
var
   v:t_vector;
   l,p:word;
   m:real;
procedure inicializar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_vector; var lim:word);
var aux:real;
begin
    lim:=0;
    readln (aux);
    while (lim<n) and (aux<>0) do
    begin
         inc (lim);
         vector[lim]:= aux;
         readln (aux);
    end;
end;
procedure may (var vector:t_vector; lim:word; var mayor:real; var pos:word);
var i:word;
begin
     mayor:= vector[1];
     pos:=1;
     for i:=1 to lim do
     begin
         if vector[i]>mayor then
         begin
            mayor:=vector[i];
            pos:=i;
         end
         else
             if vector[i]=mayor then
                mayor:=vector[i];
     end;
end;
begin
     inicializar (v);
     cargar (v,l);
     may (v,l,m,p);
     writeln ('El mayor ocupa la posicion ', p);
     readkey;
end.
