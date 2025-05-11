Program TP6_10;
uses crt;
var c1,c2:string;
    r:integer;

procedure mayorcad (cadena1:string; cadena2:string; var res:integer);
begin
     if (length (cadena1)) > (length (cadena2)) then
     begin
          res:= 1;
     end
     else
         res:= 2;
end;
begin
     writeln ('Ingrese la cadena 1');
     readln (c1);
     writeln ('Ingrese la cadena 2');
     readln (c2);
     mayorcad (c1,c2,r);
     case r of
          1:writeln ('La cadena 1 es la mas extensa');
          2:writeln ('La cadena 2 es la mas extensa');
     end;
     readkey;
end.
