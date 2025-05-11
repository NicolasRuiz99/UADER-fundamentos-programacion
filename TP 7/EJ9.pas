Program TP7_9;
uses crt;
const
     n=100;
type
    t_vector= array [1..n] of real;
var
   v:t_vector;
   l,cp,ci:word;
   acp,aci:real;
procedure inicializar (var vector:t_vector);
var i:1..n;
begin
     for i:=1 to n do
         vector[i]:=0;
end;
procedure cargar (var vector:t_vector; var lim:word);
var aux:real;
begin
    readln (aux);
    while (lim<n) and (aux<>0) do
    begin
         inc (lim);
         vector[lim]:= aux;
         readln (aux);
    end;
end;
procedure media (var vector:t_vector; lim:word; var contpar:word; var contimpar:word; var acpar:real; var acimpar:real);
var i:word;
begin
     contpar:=0;
     contpar:=0;
     acpar:=0;
     acimpar:=0;
     for i:=1 to lim do
     begin
          if (i mod 2) = 0 then
          begin
               inc (contpar);
               acpar:=acpar+vector[i];
          end
          else
          begin
               inc (contimpar);
               acimpar:=acimpar+vector[i];
          end;
     end;
end;
begin
     l:=0;
     inicializar (v);
     cargar (v,l);
     media (v,l,cp,ci,acp,aci);
     writeln ('La media de numeros de posiciones pares es de ', (acp/cp):2:3);
     writeln ('La media de numeros de posiciones impares es de ', (aci/ci):2:3);
     readkey;
end.
