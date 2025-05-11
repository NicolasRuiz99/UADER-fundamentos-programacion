Program EJ16;
uses crt;
var a,b,i:integer;
begin
     writeln ('Ingrese valor a');
     readln (a);
     writeln ('Ingrese valor b');
     readln (b);
     clrscr;
     for i:=a to b do
     begin
          if i>7 then
          begin
               if ((i mod 2) = 0) or ((i mod 3)=0) or ((i mod 5)=0) or ((i mod 7)=0) then
               begin

               end
               else
                   writeln (i);
          end
          else
              begin
                   if (i=2) or (i=3) or (i=5) or (i=7) or (i=1)then
                      writeln (i);
              end;
          end;
          readkey;
end.
