Program EJ11;
uses crt;
var a,b,cont1,cont2,i:integer;
begin
     for i:=1 to 50 do
     begin
         writeln ('Ingrese valor a');
         readln (a);
         writeln ('Ingrese valor b');
         readln (b);
         if a>b then
         begin
            cont1:=cont1+1;
         end
         else
             cont2:=cont2+1;
     end;
     writeln ('Hay ', cont1, ' pares en los que a es mayor a b, y ', cont2, ' pares en los que b es mayor que a');
     readkey;
end.
