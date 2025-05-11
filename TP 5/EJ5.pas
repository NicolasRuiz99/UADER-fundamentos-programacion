Program EJ5;
uses crt;
var i,cont,nro:integer;
begin
     for i:=1 to 100 do
     begin
         writeln ('Ingrese numero');
         readln (nro);
         if (nro mod 2)=0 then
         begin
              writeln (nro, ' es multiplo de 2');
              cont:=cont+1
         end;
     end;
     writeln ('Hay ', cont, ' numero/s multiplos de 2');
     readkey;
end.
