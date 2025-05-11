Program EJ6;
uses crt;
var i,cont1,cont2:integer;
    car:char;
begin
     cont1:=0;
     cont2:=0;
     for i:=1 to 8 do
     begin
          writeln ('Ingrese caracter');
          readln (car);
          case car of
          '*': cont1:=cont1+1;
          'a': cont2:=cont2+1;
          end;
     end;
     writeln ('Hay ', cont1, ' * y ', cont2, ' a');
readkey;
end.
