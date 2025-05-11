Program TP6_12;
uses crt;
var nro,r:integer;
procedure pim (num:integer; var res:integer);
begin
     if (num mod 2) = 0 then
     begin
          res:=0;
     end
     else
         res:=1;
end;
begin
     writeln ('Ingrese un numero entero');
     readln (nro);
     pim (nro,r);
     case r of
          0:writeln ('El numero es par');
          1:writeln ('El numero es impar');
     end;
     readkey;
end.
