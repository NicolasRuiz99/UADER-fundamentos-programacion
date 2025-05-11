Program TP6_17;
uses crt;
var nro,r:integer;
procedure suma (num:integer; var res:integer);
var i:integer;
begin
     res:=0;
     for i:=1 to num do
         res:= res + i;
end;
begin
     writeln ('Escriba un numero para realizar la suma: 1+2+3+...+n');
     readln (nro);
     suma (nro,r);
     writeln ('El resultado de la suma es de: ', r);
     readkey;
end.
