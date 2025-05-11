Program EJ15;
uses crt;
var f,i,a,b,res:integer;
begin
     writeln ('Ingrese valor a');
     readln (a);
     writeln ('Ingrese valor b');
     readln (b);
     clrscr;
     for i:=a to b do
     begin
          for f:=1 to 10 do
          begin
               res:=i*f;
               writeln (i, ' por ', f, ' es ', res);
          end;
     end;
     readkey;
end.
