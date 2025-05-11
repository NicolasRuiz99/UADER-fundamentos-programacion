Program TP6_16;
uses crt;
var c:string[1];
    r:integer;
procedure vocal (car:string[1]; var res: integer);
begin
     if (car = 'a') or (car = 'e') or (car = 'i') or (car = 'o') or (car = 'u') or (car = 'A') or (car = 'E') or (car = 'I') or (car = 'O') or (car = 'U') then
     begin
          res:=0;
     end
     else
         res:=1;
end;
begin
     writeln ('Ingrese un caracter');
     read (c);
     vocal (c,r);
     case r of
          0: writeln ('El caracter es una vocal');
          1: writeln ('El caracter no es una vocal');
     end;
     readkey;
end.


