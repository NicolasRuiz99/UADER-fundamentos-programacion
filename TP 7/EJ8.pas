Program TP7_8;
uses crt;
const
     n=100;
type
    t_vector= array [1..n] of real;
var
   v:t_vector;
   l,r:word;
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
procedure min (vector:t_vector; lim:word; var minimo:real; var rep:word);
var i:word;
begin
     minimo:=vector[1];
     rep:=0;
     for i:=1 to lim do
     begin
          if vector[i]<minimo then
          begin
               rep:=0;
               minimo:=vector[i];
          end
          else
              if minimo=vector[i] then
                 rep:=rep+1;
     end;
end;
begin
     inicializar (v);
     cargar (v,l);
     min (v,l,m,r);
     writeln ('El valor minimo: ', m:3:2, ', se repite ', r, ' veces');
     readkey;
end.
