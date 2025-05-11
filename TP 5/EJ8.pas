Program EJ8;
uses crt;
var i,resp,sist1,sist2,sist3:integer;
begin
     for i:=1 to 1200 do
     begin
          writeln ('Ingrese sistema preferido');
          readln (resp);
          case resp of
          1: sist1:=sist1+1;
          2: sist2:=sist2+1;
          3: sist3:=sist3+1;
          else
              writeln ('Sistema no existente');
          end;
     end;
     if (sist1>sist2) and (sist1>sist3) then
     begin
        writeln ('El sistema 1 es el preferido');
     end
     else
     begin
          if sist2>sist3 then
          begin
             writeln ('El sistema 2 es el preferido');
          end
          else
              writeln ('El sistema 3 es el preferido');
          end;
readkey;
end.
