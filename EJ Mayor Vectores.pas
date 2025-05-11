//Dado un vector con nros reales determinar su mayor componente y si existe mas de uno mostrar las veces que se repite
Program EJ;
uses crt;
const n=100;
type
    t_dato=real;
    t_vector=array [1..n] of t_dato;
var c:integer;
    r:real;
    vector:t_vector;
    l:word;
procedure inicializar (var v:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         v[i]:=0;
end;
procedure cargar (var v:t_vector; var lim:word);
var aux:real;
begin
     lim:=0;
     readln (aux);
     while (lim<n) and (aux<>0) do
     begin
          inc (lim);
          v[lim]:=aux;
          readln (aux);
     end;
end;
procedure det (lim:word; var v:t_vector; var contador:integer; var result:real);
var i:1..n;
begin
     contador:=0;
     result:=v[1];
     for i:=1 to lim do
     begin
          if (result < v[i]) then
          begin
               result:=v[i];
               contador:=1;
          end
          else
              if (result=v[i]) then
                 contador:=contador+1;
     end;
end;
begin
     inicializar (vector);
     cargar (vector,l);
     det (l,vector,c,r);
     writeln ('El componente mayor es ',r:5:2 ,' y se repite ',c ,' veces');
     readkey;
end.
