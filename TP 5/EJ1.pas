Program EJ1;
uses crt;
var val1,val2,i:integer;
begin
     for i:=1 to 5 do
     begin
          writeln ('Ingrese valor 1');
          readln (val1);
          writeln ('Ingrese valor 2');
          readln (val2);
          clrscr;
          writeln ('Valor 1: ', val1, ' Valor 2: ', val2);
          if (val1>0) and (val2>0) then
             writeln ('El promedio es ', ((val1+val2)div 2));
     end;
readkey;
end.
