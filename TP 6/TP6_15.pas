Program TP6_15;
uses crt;
var c:string[1];
    r:integer;
procedure digito (car:string[1]; var res: integer);
begin
     if (car = '0') or (car = '1') or (car = '2') or (car = '3') or (car = '4') or (car = '5') or (car = '6') or (car = '7') or (car = '8') or (car = '9') then
     begin
          res:=0;
     end
     else
         res:=1;
end;
begin
     writeln ('Ingrese un caracter');
     read (c);
     digito (c,r);
     case r of
          0: writeln ('El caracter es uno de los digitos del 0 al 9');
          1: writeln ('El caracter no se encuentra entre los digitos del 0 al 9');
     end;
     readkey;
end.
