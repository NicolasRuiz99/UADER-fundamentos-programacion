Program EJ14;
uses crt;
var nro,i,res:integer;
begin
     writeln ('Ingrese numero');
     readln (nro);
     clrscr;
     for i:=1 to 10 do
     begin
          res:= nro*i;
          writeln (nro, ' por ', i, ' es ', res);
     end;
     readkey;
end.
