Program EJ4;
uses crt;
var car:char;
    i,nro:integer;
begin
     writeln ('Ingrese caracter');
     readln (car);
     writeln ('Ingrese numero');
     readln (nro);
     for i:=1 to nro do
     begin
         writeln (car);
     end;
     readkey;
end.
