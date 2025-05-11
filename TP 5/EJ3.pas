Program EJ3;
uses crt;
var i,max,pos,nro:integer;
begin
     max:=0;
     for i:= 1 to 475 do
     begin
          writeln ('Ingrese numero');
          readln (nro);
          if nro > max then
          begin
               max:=nro;
               pos:=i;
          end;
     end;
     clrscr;
     writeln ('El maximo del conjunto es ', max, ' leido en la posicion ', pos);
     readkey;
end.
